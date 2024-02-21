Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A251285D3EA
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:42:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ALzKIh6U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfrsF41Csz3dRc
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:42:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ALzKIh6U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrrr4607z3cS3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:48 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-58e256505f7so4385027eaf.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508506; x=1709113306; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwaPddAHaW12NHPZqCdSQa33972trzIVhKPHEitazSE=;
        b=ALzKIh6UflVGXrjNdJOdPWdnSzqBg+9vA1j0DOpjbWVccLVjKTcoEr7BKLE9drMqKu
         R3pHDkc/qhpKdVDKvVMtthhnIE5fs4ZIZg9W3PacuNNWY3XFD4abezLGIjeq1kYdCws8
         sz0qfrrrxqGClIukjW8NQATJ/Y+xyYJEPB+c3bm+jSKexnAF6T/UzJDa51OeqD9kXFx5
         wSyRe/dNwPL5BGdrb93khZto2c5DSyDWe+JQzUWpZelNhAkrDa3LH2zHhiLbjiW73C6L
         V61P+KQanHpmKqYUKL+58buD/Vatl5HIxFALTNcVQMpXfr2L9dVrv92N+48v2JMPd6iE
         wGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508506; x=1709113306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwaPddAHaW12NHPZqCdSQa33972trzIVhKPHEitazSE=;
        b=myU9BN4XBlE9wQVcaN3BFc8bPTqCBzf9mR6tn1Wf6eVwh3tq4C591UTOIbWr3DSNkc
         hUdgfk0HZtttYi+v8NJNBJ5u9Y+YFsUVmTSGfkEZdx053I8d/zJLZ+uBbMfiuXWFF9K+
         /r1+wvVFNzPeWiy2JbOHI6gyok9zlwm4Og6KPGbHiure/k61GUQcbIs3HyAnNISHzMKz
         BVAt1DYV3BsPJbf2uC58COss8J5qz/T96Cm+ByV5Z7aHZSv/A7h6BNp8wVkbJLpgjI3t
         ixmpJHlx3Rap8szCxsd5qtYo2PrahqOfkl/nf5yubKT3MlKqYbhWiKsBHKPdp0Vl4EZT
         huQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZQ6uUAOc1p3lDRWeyMZZygan0IBlxC5rj8Y4v0Ld0sDDBpMiK1g97Ne6BDive3lmQe1oHgDtShYMhNZWnNmkLiPppXnDWLNVh1HgAw==
X-Gm-Message-State: AOJu0YwpI6wiuA7LWbfZAchOkAhrDW7wpC8YytH92DRhSaq6PDSd+Qik
	AxuNi6mSFas+IpBbE56229lZ8oaID0irgVXr3XCh8ChzJP2KKCR/
X-Google-Smtp-Source: AGHT+IH9KausZCmEwF7YcdF99VdVzBOSScc7I1ThUC1gnUhh1vP5Hczr8cX8G0iOAghG0hmI5AWQaA==
X-Received: by 2002:a05:6359:412a:b0:17b:5529:d9d8 with SMTP id kh42-20020a056359412a00b0017b5529d9d8mr2408847rwc.9.1708508506595;
        Wed, 21 Feb 2024 01:41:46 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:46 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] ARM: dts: aspeed: Harma: Revise max31790 address
Date: Wed, 21 Feb 2024 17:39:22 +0800
Message-Id: <20240221093925.2393604-8-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
References: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Revise max31790 address from 0x30 to 0x5e

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 4d5d1c822fa3..83da7e46bb42 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -192,9 +192,9 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	max31790@30{
+	max31790@5e{
 		compatible = "max31790";
-		reg = <0x30>;
+		reg = <0x5e>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -212,9 +212,9 @@ tmp75@4b {
 &i2c2 {
 	status = "okay";
 
-	max31790@30{
+	max31790@5e{
 		compatible = "max31790";
-		reg = <0x30>;
+		reg = <0x5e>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
-- 
2.25.1

