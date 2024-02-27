Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2082A868647
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:47:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kg51GN3B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL2z6P3sz3c3w
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:47:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kg51GN3B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL2m73mwz3cNl
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:28 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso7423145ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998447; x=1709603247; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtUXz+HyXntUYvPu0c3yAr8OxqLOOI9DlELoYq4T+Ug=;
        b=Kg51GN3BPINHPvo3w2yOmlZ1HXik0kE6zgnfCw8O6EGdGHz02t11mQ85v8HBvWaqqf
         fKHMZv9bvF6IltCDza1Ipns3v6uYhmUKlMjs6Ihb0xwJF+LttLAd6ufbt1/4jpL/Z1yn
         jrPCuYBRYqIQ7xrudzAceJMcLc2ELNCTZWeYO7lOJ+5jwKhPhbQ3nJXs3JnGbY7OeU4o
         O35h8ERpPdQnBZcRsJutDlOrNb08HNYz0ctf2UMHx4+mtNG1K7B+Td7m6X/rSbmchQfb
         VHAOD4HMDn9fR48SHP+ShtYSYhMCviOWGXRD9G16lrKVO0b82zJa8Ip24euk50K0FxrX
         QRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998447; x=1709603247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtUXz+HyXntUYvPu0c3yAr8OxqLOOI9DlELoYq4T+Ug=;
        b=nMOw8QdXbeW1M3/q4ZtMvD6p5FNvvtnzZy2Hs/UtKt48ayZOuORiPTwhH14/MT0PNY
         g/0pgCBZmKEBKqM7GOeFIrchdNtNi+winyWwHehOsVHzl0VGU5Vr5d8sK+mWucKPlD7N
         dn2a5rkbh/PKoWBbmDDTfoh5fnYHMySL9S2t9qnKvF6Br1uT0Q8I28qaO2k5PQT08UoP
         hIRb3a/yc33ko7QRJqRfsStW+8E6auKzrh13PjHa8V8M6zBtbDVRk1UB9tgSh5Q/mnIC
         U/jcfz2arVS7zDo61k5yt1+gBoWm54Dx74hwoKWKh4C8bN3t5PkaUcmm+ZQjZluFd+Kj
         dCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPYcKRmdqb3lNKQ5mwK/KaPSLeOTJ34UFxjHoBFjFvMe8LMvS8yFbWZuo/OpBGrP8EkFDPSaJ+sbKg2tfXG/ifSBuZ7tkOHd+3isHx9Q==
X-Gm-Message-State: AOJu0Yz0O0a4YUJ8Qjlh405mYcJQzbhpOmzOsZxx2p3UebignI+CdQpv
	oZOMZ4p6OTEVpUQuHtLp9nwiVgyHtrVGIE8l8CWIhoLmAwUK5ZeB
X-Google-Smtp-Source: AGHT+IE5uR+ORUDeC7BTu28ujyXZdBNceJji3J1hfR7Wribes27YPwH77+0KYoHvLZBLYGlqGfa2mw==
X-Received: by 2002:a17:902:82c5:b0:1d5:f36c:8737 with SMTP id u5-20020a17090282c500b001d5f36c8737mr7880836plz.68.1708998447036;
        Mon, 26 Feb 2024 17:47:27 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:26 -0800 (PST)
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
Subject: [PATCH v4 01/10] ARM: dts: aspeed: Harma: Revise SGPIO line name.
Date: Tue, 27 Feb 2024 09:47:10 +0800
Message-Id: <20240227014719.3037588-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmLvP8Qbepm1AVjuCbaKw@mail.gmail.com/

Change log:

v3 -> v4
  - Patch 0010 - Revise node name
  - fixed PDB temperature node name in Patch 0006

v2 -> v3
  - Patch 0007 - Revise max31790 address
  - Patch 0008 - Harma: Add NIC Fru device
  - Patch 0009 - Add ltc4286 device

v1 -> v2
  - Add infineon,slb9670 information for tpm.
  - Patch 0006 - Add PDB temperature.

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

