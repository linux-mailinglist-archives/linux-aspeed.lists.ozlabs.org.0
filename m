Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D056C647
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jul 2022 05:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfwQX6By2z3c61
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jul 2022 13:20:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=C1hGF38g;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--davidgow.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=36vpiyggkdbmwte1wz7fz77z4x.v75416dg-tb8xxw41bcb.7i4tub.7az@flex--davidgow.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=C1hGF38g;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfwPn16nwz3byt
	for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Jul 2022 13:20:13 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id p7-20020a25d807000000b0066e36989a90so361899ybg.8
        for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Jul 2022 20:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=NSq+v/AerT1u/xIehHjLvE9afDtIY4Z4+byU67UBipA=;
        b=C1hGF38gKNg0xkmrhQb1GK6dUD3uqQPk+WcY/onbwQ/wLlkz0YYTjxf5Mtvth4iZHV
         Erjj5X5XWxHLFMN4taQtCwYgLvyrDTcgwPRd4/BkMPOMwDeNSEooD2Wk+LbDFgoFsGBw
         +fP03GWC98UKBmCUkHLgcXaWo80ni8EZc6Y8vVrxgWlWj4b/Ak0TMO9CcsL6mmRQ+wPC
         Phfi+KeJ89SFk2iVoaC0kcc3wX2uBLedkSXTiiMfvBMS3k0Iqb11qXZcxdDlGAiuNv6O
         h4fv2NkBCIu4kTho6sNWTArPkFSJylF0UVLzAACI1fxP62/HMibHguGjnnzIVDLv8FHo
         Hozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=NSq+v/AerT1u/xIehHjLvE9afDtIY4Z4+byU67UBipA=;
        b=IWvAxjoKOnFoiRAQWsPn2gTM9SYPbFNav5CouoRh2DbAht3KkJCJsWSEKc9fY5kvtQ
         KGOWMor4FdnyZ0ZVebVO1dmNQAanTkjfoBvqloYzWzQFcgfWanoiWdp0nQJRzYbAdmad
         Hvysg5OR0HSo3TgvgbsVPOhaZ/VvpfiFpZmb2kBjCJH768incpThn8/rVsq0KFSm26oM
         PPzsPgIvAt3CBBG5vI4eKO8bqz2MdKCjtmK4KM6ddeBDG/iG3TY3C2N477d9lRiIpz+i
         eTDLxC6MKil/c9l0bo00VPP2jbUuWtzngI6njB/k54rvnPnGAKU03QlAYi/pfMy1jmy9
         I0zg==
X-Gm-Message-State: AJIora80qIagp06X7uWRMdgq2J4yKd4ujuzw48rJ3qWTS9sdS2X+M0Ig
	auDJ2Dw2icOlOVtXV4RI9P8G+58xLYLmhA==
X-Google-Smtp-Source: AGRyM1vou50vKvBnLbzyy4WqV2zZGxb2PYevY4SXQ9Hp/LqGCgVoWf1NqFWpAYI7GfNkaDyOVIsw+0/VrA1Jbw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a0d:e2d2:0:b0:31c:82a3:2bc8 with SMTP id
 l201-20020a0de2d2000000b0031c82a32bc8mr7611840ywe.304.1657336810994; Fri, 08
 Jul 2022 20:20:10 -0700 (PDT)
Date: Sat,  9 Jul 2022 11:19:57 +0800
In-Reply-To: <20220709032001.819487-1-davidgow@google.com>
Message-Id: <20220709032001.819487-2-davidgow@google.com>
Mime-Version: 1.0
References: <20220709032001.819487-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v4 1/5] kunit: unify module and builtin suite definitions
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andra Paraschiv <andraprs@amazon.com>, 
	Longpeng <longpeng2@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
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
Cc: David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
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
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Signed-off-by: Daniel Latypov <dlatypov@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

Changes since v3:
https://lore.kernel.org/linux-kselftest/20220625050838.1618469-2-davidgow@g=
oogle.com/
- Rebase on top of the TAINT_TEST patch series. This should now apply
  cleanly on top of the kunit branch:
  https://lore.kernel.org/linux-kselftest/20220708044847.531566-1-davidgow@=
google.com/T/#u
- Add Brendan's Reviewed-by tags.

No changes to this patch since v2:
https://lore.kernel.org/linux-kselftest/20220621085345.603820-2-davidgow@go=
ogle.com/

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
 include/kunit/test.h   | 49 +++++----------------------------------
 include/linux/module.h |  5 ++++
 kernel/module/main.c   |  6 +++++
 lib/kunit/test.c       | 52 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 68 insertions(+), 44 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 7646d1bcf685..cb155d3da284 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -250,42 +250,9 @@ static inline int kunit_run_all_tests(void)
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
-	module_exit(kunit_test_suites_exit)				\
-	MODULE_INFO(test, "Y");
-#else
-#define kunit_test_suites_for_module(__suites)
-#endif /* MODULE */
-
 #define __kunit_test_suites(unique_array, unique_suites, ...)		       \
+	MODULE_INFO(test, "Y");						       \
 	static struct kunit_suite *unique_array[] =3D { __VA_ARGS__, NULL };     =
\
-	kunit_test_suites_for_module(unique_array);			       \
 	static struct kunit_suite **unique_suites			       \
 	__used __section(".kunit_test_suites") =3D unique_array
=20
@@ -295,16 +262,12 @@ static inline int kunit_run_all_tests(void)
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
index 8b11552dc215..246645eb3cef 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -10,6 +10,7 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/panic.h>
 #include <linux/sched/debug.h>
@@ -613,6 +614,49 @@ void __kunit_test_suites_exit(struct kunit_suite **sui=
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
@@ -707,13 +751,19 @@ EXPORT_SYMBOL_GPL(kunit_cleanup);
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
2.37.0.rc0.161.g10f37bed90-goog

