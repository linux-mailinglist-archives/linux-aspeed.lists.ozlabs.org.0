Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2180E533
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bp2lhE5A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9qm2xtLz3by8
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bp2lhE5A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qW3tlBz3bmQ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:15 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28ac6ecb9bdso94365a91.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367653; x=1702972453; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYoSEBzEJ/i6iAAejX6uD3fB03NRJtyC9eYU806fHGg=;
        b=Bp2lhE5AN51uB9LwL11rc0VY7zTOuqZZYxW7XFklBRgHf6bmCcXzYuHkq5JzCnLKrs
         pZcTR+Yn6kRmpblr2c8Rcmv1ot+iG9V2EFAmTQ+IjE/4Q5kcwULaAniJkSzMObJgrwqf
         zxv1A5DMcZkJ734TtbSmgnPNhrkyi8iV9e3/RDnf/OyCSQAoYDmrjJVRzMNx2kqM+SyQ
         4sHDoMasq3Q6pnEkg9vFiFa80c2e/JpfTwInrEe3QNoiDSCWrEhJxQ1KAcPuC4lKGswp
         /h2PmS5GUcaNPeZcpQYBbd+t71kLKMPZpG6wgwpEy9cN/rPEzvgYOoOe8GGdClP+elKY
         ELsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367653; x=1702972453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYoSEBzEJ/i6iAAejX6uD3fB03NRJtyC9eYU806fHGg=;
        b=gc12wHZWZYYV/leXe+jrSbXPtSIyrHR1GQShnrZwniY0gOSU2TsBlqODbFzqtdxrf0
         3IWt/ZdDUczVmdixiinPdI+cV4kU0xN+SHem+7r9qDRu1akwMVv0Sq9AW9wuCko7hjjx
         j3mGkfwwxuHvy7h63fP4LAUT8JU7IQWf14yX3wLjLURa+Pix6V3ipaEZuF5YOSJEkCSw
         szv+2xyIpm8w/IHadzEWzoUj+OC4TulHyEhVwyJylkFgOt8T5TlpnvaE2JuJByLXyUqR
         RaW6MhJDUsAc4rtUZQB2mntCiHTRvpI0/M5LNN9a0dRF7nITq7pNkt/HBcGPRqrff+Ei
         rM8Q==
X-Gm-Message-State: AOJu0YyLpYeA95ezGDFvJLV87mU+QuyeIqc5V4n5yyNsQA/kUvYs4DpC
	aRx9P8i0VV5CGQKvI4v7zPk=
X-Google-Smtp-Source: AGHT+IF7Zo4TS0bMKNUvfOxKnxKYa98o6T4jSkePwBsMjb1i6QJF38Uq++dQYabgc50/Zho+o/KXew==
X-Received: by 2002:a17:90a:9918:b0:286:1e90:fe2f with SMTP id b24-20020a17090a991800b002861e90fe2fmr7032544pjp.15.1702367652929;
        Mon, 11 Dec 2023 23:54:12 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:12 -0800 (PST)
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
Subject: [PATCH 03/11] ARM: dts: aspeed: minerva: Change sgpio use
Date: Tue, 12 Dec 2023 15:51:52 +0800
Message-Id: <20231212075200.983536-4-yangchen.openbmc@gmail.com>
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

Correct the sgpio use from sgpiom1 to sgpiom0

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 9979dba1ef0e..ad77057f921c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -78,7 +78,7 @@ &rtc {
 	status = "okay";
 };
 
-&sgpiom1 {
+&sgpiom0 {
 	status = "okay";
 	ngpios = <128>;
 	bus-frequency = <2000000>;
-- 
2.34.1

