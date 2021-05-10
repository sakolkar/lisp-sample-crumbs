{% extends "layouts/default.html" %}

{% block title %}Crumbs in Lisp{% endblock %}


{% block vuepage %}

import { Sidebar } from '{{ crumbs-path }}/sidebar.js'

const Page = {
  name: 'Page',
  template: `
    <div class="d-flex vh-100">
      {% comment %}
      {% for a in a-list %}
      {% endfor %}
      {% endcomment %}
      <Sidebar width="25%"
               :title="{text: 'Crumbs in Lisp', link: '/', icon: 'bi-code-square'}">
        <template #entry="entryProps">
          <span v-text="entryProps.index" class="me-2"></span>
          <span v-text="entryProps.entry.text"></span>
        </template>
      </Sidebar>
    </div>
  `,
  components: {
    'Sidebar': Sidebar
  },
}

{% endblock %}