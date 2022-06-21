Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAF552D76
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jun 2022 10:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS0gz5MDHz3bxt
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jun 2022 18:54:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=W5Mqh+r4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jyexyggkdbyzwh4z2ai2aa270.ya8749gj-web00z74efe.al7wxe.ad2@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=W5Mqh+r4;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS0gD3qgkz3bc8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jun 2022 18:54:00 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-317f6128c86so24958547b3.22
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jun 2022 01:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=nJz31fD/Qn5aBBpUWgybP8ILVlSKb1nLFQuC5dZKu0w=;
        b=W5Mqh+r4xo+C5OFuGYOVQuLPL+lEgUHN0AQLfdDyjYuVlh7yRrncm8NNiH0Lrku/Gd
         BvGiYUvWq+s/zpYN/6GnBBKw1eaDIVmHCK0JPVbi51jP95yiCpwpzTEGosmrweprbSX8
         bN0xZl9GoJ9l7g/BRsPfsWQaLSBk1vUWjL7x7Er7P9m9OZkSt6SIB5ELhtTe3KQL96OU
         lfL5WkeaxWwM9uhNsefMESiw8fuX9EmTHAtTechHdqYKMR16pEzlZlNtF4PGFoF2NQpp
         c5lN5aNOJgKIoQk2e1GukF/dvisCXEmIlyXf8MzvPDyHMSaJwdSWNBKasb3b0Wr76shH
         eqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=nJz31fD/Qn5aBBpUWgybP8ILVlSKb1nLFQuC5dZKu0w=;
        b=lGqohhEUhq12SWzTX+fT/jeSCIIvJ1FCoI1j1RkqL3XSrRqoAID6jcNpWW7yqpSU/R
         FYvHbOPZDUdXrPBeqPFODbZPEW7mDJ2fn7US1j5Biu/pHS1jYwhHR5+gus4xaH8Vb0HI
         qSwi09/+1b7yDAAfH3U88QVdpU4k7N/v9r2bKdctFwUUcZKCwNORASMNsvXYAQQ4W+D8
         j0kGGhVuQuMdwe5OGzcxss6HZExsv5/fHXpYGX/bQW4/lTOtqU9EjVhkbsL59IA9NJyL
         8D0ZKrazjnGED/78EACgeHihuhvw9IKBnzIu0H626vueerPKCHnBXNRuSqQPcJt4YUOe
         TQSA==
X-Gm-Message-State: AJIora88aChYFptDY/WjpusLpQ/oF1A2pny/Z3aYHu0xvROw1ejOTdyI
	BxrOe1aiuagg7kAy1oucEwi9LPIkc7Uqfg==
X-Google-Smtp-Source: AGRyM1t/fCQ8daNRyfPeK2/3cx1tcWYNdTGxDgGjepwzuyK16vVOm9/BTMsp0OPaZhdHPgxLjhaDjBJ7muYi8A==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:3a83:0:b0:317:82a1:a74 with SMTP id
 h125-20020a813a83000000b0031782a10a74mr24570781ywa.404.1655801637397; Tue, 21
 Jun 2022 01:53:57 -0700 (PDT)
Date: Tue, 21 Jun 2022 16:53:41 +0800
In-Reply-To: <20220621085345.603820-1-davidgow@google.com>
Message-Id: <20220621085345.603820-2-davidgow@google.com>
Mime-Version: 1.0
References: <20220621085345.603820-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH v2 1/5] kunit: unify module and builtin suite definitions
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, Paraschiv@google.com, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Jeremy Kerr <jk@codeconstruct.com.au>

Currently, KUnit runs built-in tests and tests loaded from modules
differently. For built-in tests, the kunit_test_suite{,s}() macro adds a
list of suites in the .kunit_test_suites linker section. However, for
kernel modules, a module_init() function is used to run the test suites.

This causes problems if tests are included in a module which already
defines module_init/exit_module functions, as they'll conflict with the
kunit-provided ones.

This change removes the kunit-defined module inits, and instead parses
the kunit tests from their own section in the module. After module init,
we call __kunit_test_suites_init() on the contents of that section,
which prepares and runs the suite.

This essentially unifies the module- and non-module kunit init formats.

Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Signed-off-by: Daniel Latypov <dlatypov@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

Changes since v1:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-2-davidgow@g=
oogle.com/
- Fix a compile error with CONFIG_KUNIT=3Dm (Thanks Christophe Leroy,
  kernel test robot)
- Add Ma=C3=ADra's Tested-by.

Changes since RFC:
https://lore.kernel.org/linux-kselftest/101d12fc9250b7a445ff50a9e7a25cd74d0=
e16eb.camel@codeconstruct.com.au/
- I've basically just rebased it, tweaked some wording, and it made it
still compile when CONFIG_MODULES is not set.

---
 include/kunit/test.h   | 47 ++++----------------------------------
 include/linux/module.h |  5 ++++
 kernel/module/main.c   |  6 +++++
 lib/kunit/test.c       | 52 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 67 insertions(+), 43 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 8ffcd7de9607..54306271cfbf 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -250,41 +250,8 @@ static inline int kunit_run_all_tests(void)
 }
 #endif /* IS_BUILTIN(CONFIG_KUNIT) */
=20
-#ifdef MODULE
-/**
- * kunit_test_suites_for_module() - used to register one or more
- *			 &struct kunit_suite with KUnit.
- *
- * @__suites: a statically allocated list of &struct kunit_suite.
- *
- * Registers @__suites with the test framework. See &struct kunit_suite fo=
r
- * more information.
- *
- * If a test suite is built-in, module_init() gets translated into
- * an initcall which we don't want as the idea is that for builtins
- * the executor will manage execution.  So ensure we do not define
- * module_{init|exit} functions for the builtin case when registering
- * suites via kunit_test_suites() below.
- */
-#define kunit_test_suites_for_module(__suites)				\
-	static int __init kunit_test_suites_init(void)			\
-	{								\
-		return __kunit_test_suites_init(__suites);		\
-	}								\
-	module_init(kunit_test_suites_init);				\
-									\
-	static void __exit kunit_test_suites_exit(void)			\
-	{								\
-		return __kunit_test_suites_exit(__suites);		\
-	}								\
-	module_exit(kunit_test_suites_exit)
-#else
-#define kunit_test_suites_for_module(__suites)
-#endif /* MODULE */
-
 #define __kunit_test_suites(unique_array, unique_suites, ...)		       \
 	static struct kunit_suite *unique_array[] =3D { __VA_ARGS__, NULL };     =
\
-	kunit_test_suites_for_module(unique_array);			       \
 	static struct kunit_suite **unique_suites			       \
 	__used __section(".kunit_test_suites") =3D unique_array
=20
@@ -294,16 +261,12 @@ static inline int kunit_run_all_tests(void)
  *
  * @__suites: a statically allocated list of &struct kunit_suite.
  *
- * Registers @suites with the test framework. See &struct kunit_suite for
- * more information.
- *
- * When builtin,  KUnit tests are all run via executor; this is done
- * by placing the array of struct kunit_suite * in the .kunit_test_suites
- * ELF section.
+ * Registers @suites with the test framework.
+ * This is done by placing the array of struct kunit_suite * in the
+ * .kunit_test_suites ELF section.
  *
- * An alternative is to build the tests as a module.  Because modules do n=
ot
- * support multiple initcall()s, we need to initialize an array of suites =
for a
- * module.
+ * When builtin, KUnit tests are all run via the executor at boot, and whe=
n
+ * built as a module, they run on module load.
  *
  */
 #define kunit_test_suites(__suites...)						\
diff --git a/include/linux/module.h b/include/linux/module.h
index abd9fa916b7d..2490223c975d 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -505,6 +505,11 @@ struct module {
 	int num_static_call_sites;
 	struct static_call_site *static_call_sites;
 #endif
+#if IS_ENABLED(CONFIG_KUNIT)
+	int num_kunit_suites;
+	struct kunit_suite ***kunit_suites;
+#endif
+
=20
 #ifdef CONFIG_LIVEPATCH
 	bool klp; /* Is this a livepatch module? */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index fed58d30725d..4542db7cdf54 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2087,6 +2087,12 @@ static int find_module_sections(struct module *mod, =
struct load_info *info)
 					      sizeof(*mod->static_call_sites),
 					      &mod->num_static_call_sites);
 #endif
+#ifdef CONFIG_KUNIT
+	mod->kunit_suites =3D section_objs(info, ".kunit_test_suites",
+					      sizeof(*mod->kunit_suites),
+					      &mod->num_kunit_suites);
+#endif
+
 	mod->extable =3D section_objs(info, "__ex_table",
 				    sizeof(*mod->extable), &mod->num_exentries);
=20
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index a5053a07409f..3052526b9b89 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -10,6 +10,7 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/sched/debug.h>
 #include <linux/sched.h>
@@ -609,6 +610,49 @@ void __kunit_test_suites_exit(struct kunit_suite **sui=
tes)
 }
 EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
=20
+#ifdef CONFIG_MODULES
+static void kunit_module_init(struct module *mod)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < mod->num_kunit_suites; i++)
+		__kunit_test_suites_init(mod->kunit_suites[i]);
+}
+
+static void kunit_module_exit(struct module *mod)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < mod->num_kunit_suites; i++)
+		__kunit_test_suites_exit(mod->kunit_suites[i]);
+}
+
+static int kunit_module_notify(struct notifier_block *nb, unsigned long va=
l,
+			       void *data)
+{
+	struct module *mod =3D data;
+
+	switch (val) {
+	case MODULE_STATE_LIVE:
+		kunit_module_init(mod);
+		break;
+	case MODULE_STATE_GOING:
+		kunit_module_exit(mod);
+		break;
+	case MODULE_STATE_COMING:
+	case MODULE_STATE_UNFORMED:
+		break;
+	}
+
+	return 0;
+}
+
+static struct notifier_block kunit_mod_nb =3D {
+	.notifier_call =3D kunit_module_notify,
+	.priority =3D 0,
+};
+#endif
+
 struct kunit_kmalloc_array_params {
 	size_t n;
 	size_t size;
@@ -703,13 +747,19 @@ EXPORT_SYMBOL_GPL(kunit_cleanup);
 static int __init kunit_init(void)
 {
 	kunit_debugfs_init();
-
+#ifdef CONFIG_MODULES
+	return register_module_notifier(&kunit_mod_nb);
+#else
 	return 0;
+#endif
 }
 late_initcall(kunit_init);
=20
 static void __exit kunit_exit(void)
 {
+#ifdef CONFIG_MODULES
+	unregister_module_notifier(&kunit_mod_nb);
+#endif
 	kunit_debugfs_cleanup();
 }
 module_exit(kunit_exit);
--=20
2.37.0.rc0.104.g0611611a94-goog

