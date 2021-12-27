<template>
  <main>
    <section class="py-4 text-center container">
      <div class="row">
        <div class="mx-auto">
          <h2 class="fw-light">
            ジョジョ立ち検定
          </h2>
          <router-link
            :to="{ name: 'ExamListIndex' }"
            class="btn btn-secondary"
          >
            検定一覧へ
          </router-link> 
        </div>
      </div>
    </section>

    <section class="py-4 container">
      <div class="row">
        <div class="mx-auto">
          <div class="text-center">~ How to Use ~</div>
          <div class="rounded border border-secondary">
            <div class="px-2 py-2">
              <p class="my-1">Step1: 受験する検定を選択</p>
              <p class="my-1">Step2: ジョジョ立ち写真を撮影</p>
              <p class="my-1">Step3: ジョジョ立ち写真をアップロード</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>

<script>
export default {
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>

</style>
