Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037211FE81
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 07:44:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bsDw48T5zDqVB
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 17:44:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BARMc7vm"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bsDl2rt8zDqTY
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 17:43:50 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id x13so4027945plr.9
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Dec 2019 22:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ux7G3MiSlS3ev/+kbJZOEXTauz/1zLMbOpd5oJaNEs=;
 b=BARMc7vmR7fmLUrTFtCSW3CaUlYVwks8CpJLZ8KcI/D9LvJqeRkjpQCg6vLYCnKJYx
 WqgdW0fkciggfydIWcknOs9sefiaS7IwbjmZ8K+wUIo3+u0R4sULSY3ZLtV9t/TFnArO
 MHBETRDDI26SPUatTvKnT1M90wqERTGDJ8eAGNnmJKzWvKEWpMbbGTmIPo4/LOyp0cya
 8UV7JOUUqTefcg6moVIsCyEj/NWeYO8L9qZGjqS8KtMcoDOXbpQcC3SRgE3t4ullRRdW
 i4Hg96dpz1UvtrT6xi74B7rGVJ5k6kRxHONdfbWhbx+6Z6beQT3HQYaNvkc87RNMTbwC
 DFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0ux7G3MiSlS3ev/+kbJZOEXTauz/1zLMbOpd5oJaNEs=;
 b=XNV4y4H+3fsICa99e3fqkuzW66wDUCHe1E4UuVvXkWnhEIq6aElrlGlhemuWW18nZb
 u+O0XNV1jF+AOGvUNWLc+FJxH7Z8yhRHNsrLGxBTzBNMZ7UHucvO/8MjnkcWoBx2egFA
 xjB6P5ylT2OppetZ83ve4AElH/3veRtwsl9EQQ0ALwhuBFpBA/kPvOumDM/oRJrIxQIX
 NM/Y8FOPE9vxOu9Dezxmr5JCPem6gGMjY8j4vaQv1TO4LJRiyq9YMpBUeZ6NocIFs0ZU
 1sN1Hj8c2kADiyIMeSzdNV85DO5dSAddAbC21H5WON2wSyYO5s4M4EdoNervvcsAPeqz
 jdNg==
X-Gm-Message-State: APjAAAU4WeRO7XyvibmOmgFQcfadwUfRIRT3XUpqqkQldRJ2gIYoGZdu
 AJ7L6LXzpWYMLUVXa7xbxxg=
X-Google-Smtp-Source: APXvYqyjExp4/F8WgIcXfWcdgponrOcUJ0xoKa5yoLp5bLwFQLCE7OA47TylREIwS9KTq6OaoebMSw==
X-Received: by 2002:a17:902:209:: with SMTP id 9mr14722232plc.58.1576478627037; 
 Sun, 15 Dec 2019 22:43:47 -0800 (PST)
Received: from localhost.localdomain
 (2403-5800-7100-3e00-2ac3-652d-4f7-6183.ip6.aussiebb.net.
 [2403:5800:7100:3e00:2ac3:652d:4f7:6183])
 by smtp.gmail.com with ESMTPSA id u20sm20121223pgf.29.2019.12.15.22.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 22:43:46 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed: AST2400 disables hw checksum
Date: Mon, 16 Dec 2019 17:41:32 +1100
Message-Id: <20191216064132.78015-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
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
Cc: Alexander Filippov <a.filippov@yadro.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There is no need to specify this property in the device tree as the
AST2400 does not have working hardware checksum and disables it in the
driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts | 1 -
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  | 1 -
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        | 3 ---
 3 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
index b1e10f0c85c9..322587b7b67d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
@@ -76,7 +76,6 @@ &uart5 {
 
 &mac1 {
 	status = "okay";
-	no-hw-checksum;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index aaa77a597d1a..54e508530dce 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -75,7 +75,6 @@ &uart5 {
 
 &mac1 {
 	status = "okay";
-	no-hw-checksum;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
index affd2c8743b1..041f28e3ac10 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
@@ -107,10 +107,7 @@ flash@0 {
 
 &mac0 {
 	status = "okay";
-
 	use-ncsi;
-	no-hw-checksum;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
 };
-- 
2.24.0

