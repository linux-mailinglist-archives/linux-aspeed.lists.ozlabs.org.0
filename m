Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33707390FEA
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 May 2021 07:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqfGc1q0Jz2yqC
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 May 2021 15:12:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Zlx5UUxE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zlx5UUxE; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqfGV2T2sz2yWR
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 May 2021 15:12:49 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id g18so86954pfr.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 May 2021 22:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BAnKXbgoQEeSmAnu5/pW7REAH8b4on9a0l5whKjM1X4=;
 b=Zlx5UUxEdGQnx1ArTAU/o3mCqdtzSczxblreJ4OTYfRRsr7nb3FEcmexvTneUJPpSz
 +hJdVnERo/p8iDqxCVlT8AoeW0CBgFjdlcMgjGHaGsL1unIzVhPZrJd0mO8ghxmMlW7g
 OJWaJ7uU683vHqvfdP2DzL+WGcSqP8ZMpFsfp8gLb4f+iGVEwd1raN1GCwqfTBg1R/bj
 0dhkxcoG87RmMzHSitNi8qxRxrU64av3QKRDnsmjn5ArGVsOEBpBB4qX3lMt/bluZ41s
 zGm18QTnqXXr8yHUKQC0rR4rVgu2hx33GXpM+QVRZ4zGp0UFeN7HHCYTcRjBgHXK7xhq
 dITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BAnKXbgoQEeSmAnu5/pW7REAH8b4on9a0l5whKjM1X4=;
 b=JpU/NtGRnZ96R3pJmXZgDEpdp4Jx5fe4VBrfSQdH5qyVMJu/O18jX/2ah9kQ1JFwIt
 tN0XQtHt+JNFz6Gf2Wdf517x2MIlOBAYv1ac28Ntmx60KXN7sm8K59YndaFabfakkOUv
 gW5eS1PEGlu0CEOcHw9ZpeWskaee7mEpDnukfQG0x+7TdNquJ9KqTcwM2CVVh071EyLb
 baNEYwMolxsFWUIJfandh4rTLUUe+sIoYs0Hwvn698+r4H4M3PSCq4AqVukBsR1OOHVJ
 o8/7BXkkGyt5vrtuCFQ0dqW1BOSjSwU0n0EKkhSv0QfSAN5jaKg4OCas+CQTr2yAjY1f
 WA9Q==
X-Gm-Message-State: AOAM532fkKlqs8t2E/Glq+HQ9w9Cd8i/YCSW4FwZ4Mui2bprVL466DdE
 s9NQ3Mhn/OB3GpXjK9L3mus=
X-Google-Smtp-Source: ABdhPJxOzmvZLiHUaOUHu9L16J28CWvyvZplgFvsgvTgllCYv1NJYwbso1Kv8YQ6bRqP0CGwgtPjKg==
X-Received: by 2002:aa7:8506:0:b029:2e4:dae2:9d89 with SMTP id
 v6-20020aa785060000b02902e4dae29d89mr25163505pfn.78.1622005961881; 
 Tue, 25 May 2021 22:12:41 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id a21sm14819684pfk.152.2021.05.25.22.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 22:12:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Set earlycon boot argument
Date: Wed, 26 May 2021 14:42:20 +0930
Message-Id: <20210526051220.136432-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ryan Sie <ryans@supermicro.com.tw>, Ben Pai <Ben_Pai@wistron.com>,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Peng <pengms1@lenovo.com>,
 Adriana Kobylak <anoo@us.ibm.com>, Yuan Yao <yao.yuan@linaro.org>,
 Ken Chen <chen.kenyy@inventec.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Brian Yang <yang.brianc.w@inventec.com>, linux-arm-kernel@lists.infradead.org,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, Xo Wang <xow@google.com>,
 Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
 Lotus Xu <xuxiaohan@bytedance.com>, Hongwei Zhang <hongweiz@ami.com>,
 Alexander Filippov <a.filippov@yadro.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


Most of the aspeed boards have copied the 'earlyprink' string in
the bootargs. However, there's no earlyprink driver configured in the
defconfigs, so this does nothing.

A combination of setting stdout in the chosen node and adding earlycon
to bootargs causes early serial output to appear early. This changes all
boards to use this option.

The console=ttyS4,115200 option is still required, as this is used by
the run time uart driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts                 | 2 +-
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts            | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts           | 2 +-
 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts     | 2 +-
 arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts        | 2 +-
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts         | 2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts            | 2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts      | 2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts         | 2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts         | 2 +-
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts           | 2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts            | 2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts         | 2 +-
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts       | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts             | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts              | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts              | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts              | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts            | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts             | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts               | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts              | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts              | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts         | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts               | 2 +-
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts        | 2 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts             | 2 +-
 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts       | 2 +-
 29 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 8bec21ed0de5..583a241f1151 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -13,7 +13,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 6aeb47c44eba..79d17841b3d7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -34,7 +34,7 @@ aliases {
 	};
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 	leds {
 		compatible = "gpio-leds";
diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 8f5ec22e51c2..bbf8d548397b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -9,7 +9,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
index c2ece0b91885..3395de96ee11 100644
--- a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
index 2c29ac037d32..7c6af7f226e7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
index dcab6e78dfa4..33e413ca07e4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
@@ -15,7 +15,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 5ef88c377358..01dace8f5e5f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -55,7 +55,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 2fb8b147f489..90a3f485c67a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -280,7 +280,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart1;
-		bootargs = "console=ttyS1,9600n8 root=/dev/ram rw earlyprintk";
+		bootargs = "console=ttyS1,9600n8 root=/dev/ram rw earlycon";
 	};
 
 	ast-adc-hwmon {
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 7b4b2b126ad8..b6b16356f571 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -37,7 +37,7 @@ aliases {
 	};
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 07593897fc9a..1752f3250e44 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
index 80c92e065a10..5a98a19f445e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
@@ -11,7 +11,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "earlyprintk";
+		bootargs = "earlycon";
 	};
 
 	memory {
diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
index 6e9baf3bba53..d5b7d28cda88 100644
--- a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "earlyprintk";
+		bootargs = "earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
index c29e5f4d86ad..8f543cca7c21 100644
--- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
@@ -27,7 +27,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
index 084c455ad4cb..bcc1820f5c07 100644
--- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
@@ -27,7 +27,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
index 73319917cb74..3ef8358ff764 100644
--- a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
@@ -11,7 +11,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@40000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
index 42b37a204241..c0847636f20b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -11,7 +11,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index 15c1f0ac81dc..a52a289cee85 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -57,7 +57,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
index 8503152faaf0..7d38d121ec6d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
@@ -11,7 +11,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts b/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
index 91dced7e7849..3d4bdad27c2d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index eb4e93a57ff4..cd660c1ff3f5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@40000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index fd2e014dae75..084f54866f38 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -9,7 +9,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index d56b5ed09b37..4816486c0c9e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index c1478d2db602..e863ec088970 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -13,7 +13,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200n8";
+		bootargs = "console=ttyS4,115200n8 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
index 01074b6e3e03..328ef472c479 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
@@ -11,7 +11,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@40000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 85d58a63ae90..230f3584bcab 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -10,7 +10,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 4bcc82046362..7ae4ea0d2931 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -17,7 +17,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 03c161493ffc..61bc74b423cf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -14,7 +14,7 @@ aliases {
 	};
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index a68ff0675c28..9605e53f5bbf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -28,7 +28,7 @@ aliases {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=ttyS4,115200 earlycon";
 	};
 
 	memory@40000000 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
index bc16ad2b5c80..50f3c6a5c0c8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
@@ -11,7 +11,7 @@ / {
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "earlyprintk";
+		bootargs = "earlycon";
 	};
 
 	memory@80000000 {
-- 
2.30.2

