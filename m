Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87480E52F
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U3Q3Y6/K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9qh0JP9z30Pr
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U3Q3Y6/K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qS6bVMz30NY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:12 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-289d988a947so3755346a91.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367650; x=1702972450; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Shdip5yjqGroTxQL7MptUpcQ2qzzAlYoyVTOz3Rc4nM=;
        b=U3Q3Y6/K+yMZ6ksoZTZYfKaOox2rPfSuWYSynDmEilnFgcL81snuFvuj8g3u71eYUG
         2Wf3iPfcRgV3Vi1Xi7/64INL5Te7bPiXId+9PiWRr6DJd6DUY6gopEEZgd4cpWI6ULTl
         gDPqro9/0GyDrvj6V0KAgXb1U17TO+ELr/bfQijxlGd8RUfRVwFjQO2F5CFUiRA/J5tk
         Q+6OKBGX78UoE05JIWStp6RuAhnsbsLylPt3+NmbUrMQHbK03GNs+gf2pIasyRJauhDa
         zPKM0HwLWG5uJnoWWeRLPkyjQbUPEkngPJt4kozyvr/3FyWTJGeqsjkCuVXzSixVWGne
         H+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367650; x=1702972450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Shdip5yjqGroTxQL7MptUpcQ2qzzAlYoyVTOz3Rc4nM=;
        b=teTOkSekacEbsLdEsj0aJKbicci5bd+3HunmBn6J5AN+OF1mHvG1ZIq0cd/91IDAOC
         E0Ko/LgItQ735zhOP6/+y9Hh+suI9Oj0H83Apczvf1LriX3kPhwWWJhHwUdGwThFgjvF
         XUw3lxsAfHs9waRiPQWzUgNfMXLEBb4wRr9ECL9Aq9BU2WgXshqfUgQU7B9zAcXTYNID
         hzO2yveL/VtHoqd9D9ILajMe3chJWWONUww9X6jpL/y/BfmjZTcZeDi9DVhNtFxkBs62
         QEEcOiDPu453czQ+His7VH9CcIJtaQcGlsynid78PjPXwokKSOgArlTlMM08xr/1pqVV
         Ej1g==
X-Gm-Message-State: AOJu0YzQXDBsr3ghZlEuJ5T82na+GhNv79RgATbjq0xmVeaE613EEyuV
	tdCRCX9DOiWvYvFFItnTl8I=
X-Google-Smtp-Source: AGHT+IEmhZs4mI8QYXlU+ypM3O08Mx6ko1LYMi5VkKIviUfPwcBJLVuPc2M6YBUukdoUvVEUh8jg0w==
X-Received: by 2002:a17:90a:65c5:b0:286:76e6:7b26 with SMTP id i5-20020a17090a65c500b0028676e67b26mr2956223pjs.36.1702367650226;
        Mon, 11 Dec 2023 23:54:10 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:09 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] ARM: dts: aspeed: minerva: Modify mac3 setting
Date: Tue, 12 Dec 2023 15:51:51 +0800
Message-Id: <20231212075200.983536-3-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Remove the unuse setting and fix the link to 100 M

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index c755fb3258a4..9979dba1ef0e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -48,10 +48,13 @@ &wdt1 {
 
 &mac3 {
 	status = "okay";
+	phy-mode = "rmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
-	use-ncsi;
-	mlx,multi-host;
+	fixed-link {
+		speed = <100>;
+		full-duplex;
+	};
 };
 
 &fmc {
-- 
2.34.1

