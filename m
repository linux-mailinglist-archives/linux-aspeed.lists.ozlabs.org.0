Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D839A8216FA
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 05:47:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mGOwXKxC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40gq4Tgwz30Q3
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 15:47:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mGOwXKxC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40fx6z4pz3bn7
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:17 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-28c467446f0so3884114a91.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jan 2024 20:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704170775; x=1704775575; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAxabFINcvVYO/q2LghOlxe+58oZ0L+QsCNCz6T1Lcg=;
        b=mGOwXKxCBZoQ26z2IMVCf04KaTHjsVpSnozgmxNkG4V6dZz49vG3FHpDrHw3H8rkSW
         VWgoobZ8rsOUgvnYeCONoK7PuUtfRPgvJ5QrKFFYyQj6JGmbxARBdf6p+sOtLF7ugM8q
         qnWaKeSuezsE3KIsb22D9DeQcTqUeDMO2HKGz1gwem1c7zaevuHSlYBIW01Pk4GPuCmT
         mNijIRj5RJaWG17xRY5wL005F/ky9EFdPztgkgICOhvkHfDde1vZRjRqSnQnbh0oZ890
         j7pw2Gp9oqXAj3jpRh56jhJWC0hkVXFSYtsCdcNXAKkoKjLULDklUcrD2oFSKvWQX7Fi
         oJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704170775; x=1704775575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAxabFINcvVYO/q2LghOlxe+58oZ0L+QsCNCz6T1Lcg=;
        b=bGlAAs6IurJSlflhDSirRUFW/t47RP9fjuAIZecVmVZxQoGHk0GJOxIfPrkQPb5A5m
         53ScbtKva4QujDZOSGyj8L0UlXYpN/7//uaIb+svN+wKEgtJlyEHrd4PYMP0jtqDSqH3
         F8DAwoXo16yse7ZpVAfVPrKYuDgNp8PDGUpSvkE/sYouoTNM6P/QzWuS/HBzQxOUg6GZ
         gp2n7vYyWEPBvMrMhVDbfL4hG8mIqXdFMFEw568NAUSazye5KOxXsfMQCKzi2pIa2DvC
         CPdkI9KnsPNEpjeTH0pLdMGDewWUS5wUirp44uxy7kMVI++/VY5Yoa3TgyhEvvwAdOmq
         sqow==
X-Gm-Message-State: AOJu0YxMj8fK+NNbCL4vUFiixEQtieT4zGCsF7SwzxOClbgj7rC7lmO3
	cI2KXREUu4Wq9S+gaoh/M8rv7K39TcU=
X-Google-Smtp-Source: AGHT+IH9IqOgrvDHv0JBk46CuYwK0n0E7o0qckt63SLybfH3Rj3RdJ4BvjYWOLWs2BqYO1BI/Oun0g==
X-Received: by 2002:a17:90a:8685:b0:28c:95fc:c322 with SMTP id p5-20020a17090a868500b0028c95fcc322mr10494576pjn.5.1704170775269;
        Mon, 01 Jan 2024 20:46:15 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090abf9500b0028c2b2b76c0sm17308392pjs.22.2024.01.01.20.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:46:15 -0800 (PST)
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
Subject: [PATCH v1 1/5] ARM: dts: aspeed: Harma: Revise SGPIO line name.
Date: Tue,  2 Jan 2024 12:44:05 +0800
Message-Id: <20240102044409.3810873-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
References: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
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

The same name as reset-control-smb-e1s
change to reset-control-smb-e1s-0 and reset-control-smb-e1s-0.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---

Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmLvP8Qbepm1AVjuCbaKw@mail.gmail.com/

Change log:

v1
  - Patch 0001 - Revise SGPIO line name.
  - Patch 0002 - Mapping ttyS2 to UART4.
  - Patch 0003 - Remove Vuart.
  - Patch 0004 - Add cpu power good line name.
  - Patch 0005 - Add spi-gpio.

---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7db3f9eb0016..8a173863ef24 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -505,9 +505,9 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"","reset-control-smb-e1s",
+	"","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
-	"","reset-control-smb-e1s",
+	"","reset-control-smb-e1s-1",
 	"host-ready-n","reset-control-srst",
 	"presence-e1s-0","reset-control-usb-hub",
 	"","reset-control",
-- 
2.25.1

