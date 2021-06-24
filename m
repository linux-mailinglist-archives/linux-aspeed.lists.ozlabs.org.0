Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 618673B2B19
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Jun 2021 11:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Z6R05sdz306n
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Jun 2021 19:07:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sBZaVsFh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sBZaVsFh; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Z6M6LH8z2yxx
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Jun 2021 19:07:54 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id g24so3082998pji.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Jun 2021 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ej5iCXQ9ktVbmo+o158yS99S5YC4dqQm21FGO2x4lio=;
 b=sBZaVsFhRAtOiOIPpxvrv+iKFxHD3xLmyQ7yvyEPzATLbiJ65JYyRZnb3r0VxwPHhq
 aODR6Eg+2aRK4PiB+fZA2PF2IUy37+JUp55PITPYI0rjGblQ94e7skInvjaGA/8xnVcW
 b1j4hS3BoFUnjSfRVNjVA4hqQgvQ/Fma8ks7YRYWFZixSMjpH0o6TC+1dak2+lcJh9Mh
 AQD+hu8por/NYZKWdMx/1jJ5pDqBT6bOXR0JoR489gp2PsIhA8ILrCL2UmaAm1a0TKPE
 GChfR3viCYCs+H+cYnJlmFsflzRwFx3kuuH/0OSnwT9HlTwxlMSGpOeLxB0SjAVvZCfw
 vvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ej5iCXQ9ktVbmo+o158yS99S5YC4dqQm21FGO2x4lio=;
 b=iAhGxzME24KCi3OwTL4exAxRTgbDGvDLZJyriR+9lHdF4qxcir1m68skBrMiy7gLSX
 RhQempMVpg26iVuPcyXhQAAwiOXRDiPNgFpThX+WT6fa/31/qmdlu5W/qMK4riQ2oQR7
 pe/3K9/zRK/uKURj/8Bno9tWgO87fL079HD39SI2ffpj7xneq/xVvsAGiwBIBADPP6AO
 UVn5vX4yHLfXhjfiRE1Vsh8bt6SthGV06ZV815U7PhJfPuqyt5sNMhImqE5d70Yw+AgH
 OP+MOrK6f19Rx9vIWiJsXSHShHFizcnbYzFcbfQpCnEeuUCGuoach2IFsCA+5qGchvS6
 Guww==
X-Gm-Message-State: AOAM530ENeF/cbzBSNIVjzq9PAk++0JbQYG1KlRypaFYnex+jmEsfwoW
 qg7bcxs2igHxROWZt3qws9Q=
X-Google-Smtp-Source: ABdhPJwYbeBj+5DwoAsPsQDbOgqKn6lQee6hwcKc0kA8F+71khW3Vi/bwtVcqJhZ+kpmTG6xa6ryKg==
X-Received: by 2002:a17:902:7103:b029:124:72fd:fbd1 with SMTP id
 a3-20020a1709027103b029012472fdfbd1mr3757386pll.64.1624525670711; 
 Thu, 24 Jun 2021 02:07:50 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id b5sm1784667pgh.41.2021.06.24.02.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:07:49 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Geissler <geisonator@yahoo.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed: Fix AST2600 machines line names
Date: Thu, 24 Jun 2021 18:37:42 +0930
Message-Id: <20210624090742.56640-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Tacoma and Rainier both have a line-names array that is too long:

 gpio gpiochip0: gpio-line-names is length 232 but should be at most length 208

This was probably copied from an AST2500 device tree that did have more
GPIOs on the controller.

Fixes: e9b24b55ca4f ("ARM: dts: aspeed: rainier: Add gpio line names")
Fixes: 2f68e4e7df67 ("ARM: dts: aspeed: tacoma: Add gpio line names")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 5 +----
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 941c0489479a..481d0ee1f85f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -280,10 +280,7 @@ &gpio0 {
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-	/*Z0-Z7*/	"","","","","","","","",
-	/*AA0-AA7*/	"","","","","","","","",
-	/*AB0-AB7*/	"","","","","","","","",
-	/*AC0-AC7*/	"","","","","","","","";
+	/*Z0-Z7*/	"","","","","","","","";
 
 	pin_mclr_vpp {
 		gpio-hog;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index e863ec088970..48038b2ef3df 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -136,10 +136,7 @@ &gpio0 {
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-	/*Z0-Z7*/	"","","","","","","","",
-	/*AA0-AA7*/	"","","","","","","","",
-	/*AB0-AB7*/	"","","","","","","","",
-	/*AC0-AC7*/	"","","","","","","","";
+	/*Z0-Z7*/	"","","","","","","","";
 };
 
 &fmc {
-- 
2.32.0

