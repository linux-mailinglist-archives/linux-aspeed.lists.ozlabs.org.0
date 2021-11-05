Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6021445D21
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 02:00:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlhxt4t8Xz2yY7
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 12:00:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rOB7r6/f;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a;
 helo=mail-yb1-xb4a.google.com;
 envelope-from=3eokeyqmkddslphdlldib.zljifkru-xpmbbaifpqp.lwixyp.lod@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=rOB7r6/f; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlhxh3K6Sz2ynj
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 12:00:06 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id
 t24-20020a252d18000000b005c225ae9e16so11175101ybt.15
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=BWRsLXSuRuX7m2v7ufxzsJ2Lj2A75oZX9+jsZ2D7yIw=;
 b=rOB7r6/fbY4l8mLPY8G3uBq2wReZq1FkHA0EBN59GTT5x8sq0UR3tghTOvqg93YHAp
 ka1dLR4hOsSUL+pyNB7Uqgw5s0H60ScBMNGlizFjPJ+LUQBEF+vfLk1e4OjZMgQc9Byd
 e2stSuja4pjQw7iO+8De8x2Vs6eNmKC3mG+rYm/fZwxHBe2DCuHQLIxmVTBTspSuerjB
 ajM8wiAa9HlwhqKJMh5nN/8j++sUnE3NjPtiq2nmk5TntUHB7+GvIh6497yJcl2VN2oV
 huoKII/Ozk5GvReIIeTaWv+F5FEfr5ssOgz+Qr4pJnTMeMZKYjN7+4OUyVi5IR9PMXaa
 zUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=BWRsLXSuRuX7m2v7ufxzsJ2Lj2A75oZX9+jsZ2D7yIw=;
 b=rr+w0wRVaCuYr+KguGwgWab4xsIJL4WN4R0RHK14abWWMjfxDzb6DFwGImOh3Dlfr5
 zcQ9eSIC8jytd+UuLM4+S5CQO5J0chjvTIteJrz+bgbhrkwHlwQD5utMTwx6uyF/2HK7
 +i36vq+Eq1pHVtC7/PEPFezm1cVL5Tb1aLz0nn6bSUPpC//afmLqiHnFhjTM+3mY7ScO
 gl+MUZIbcZDQ0mValGYeylODpL1XFu8ugMRxn49uoGcE+eqK2UtfQrsEruzsQgw6s2wO
 a1tsb/XwMTGQt6kdBocA3KT4FLLehSsrjopNIA9nsv3YHC6Zl52eg4KzpgEhmjUiZnMq
 5BeQ==
X-Gm-Message-State: AOAM5332kKnijyjMu8g/zU6+vHz1YyWoRabZcUM+QlQ+RD7yF+uxl8IJ
 8XjyDLn79pARfur69LKDMkjYkdg=
X-Google-Smtp-Source: ABdhPJxGKt0KTPJnJkQP+F1fXbU5ufjr9qUcOu3vXpvZaG/Sj3DoJSO3btei4j4hApi6sqDQHbLE7aM=
X-Received: from osk.cam.corp.google.com ([2620:15c:93:a:24f7:55ac:2f28:525])
 (user=osk job=sendgmr) by 2002:a25:50ca:: with SMTP id
 e193mr48233941ybb.324.1636074002883; 
 Thu, 04 Nov 2021 18:00:02 -0700 (PDT)
Date: Thu,  4 Nov 2021 20:59:55 -0400
Message-Id: <20211105005955.107419-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v2] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
From: Oskar Senft <osk@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This change updates the configuration for the nct7802 hardware
monitor to correctly configure its temperature sensors.

Signed-off-by: Oskar Senft <osk@google.com>
---
Changes from PATCH v1:
- Removed superfluous "status" from channels.
---
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
index 68f332ee1886..66734e4e2ea1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -213,6 +213,25 @@ &i2c0 {
 	nct7802@28 {
 		compatible = "nuvoton,nct7802";
 		reg = <0x28>;
+		channel@0 { /* LTD */
+			reg = <0>;
+		};
+		channel@1 { /* RTD1 */
+			reg = <1>;
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@2 { /* RTD2 */
+			reg = <2>;
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@3 { /* RTD3 */
+			reg = <3>;
+			sensor-type = "temperature";
+		};
 	};
 
 	/* Also connected to:
-- 
2.34.0.rc0.344.g81b53c2807-goog

