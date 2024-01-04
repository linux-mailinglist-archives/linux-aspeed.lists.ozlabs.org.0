Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76C8242F0
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 14:47:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A7BX53Zm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5SZq0SYLz3cWv
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 00:47:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A7BX53Zm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5SZk4tBTz2xqH
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 00:47:41 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d3f3ee00a2so2807755ad.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jan 2024 05:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704376059; x=1704980859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxGy7pLjWz6nitoY50e2aJeZJJqgkNuCQ+WC6P62+FQ=;
        b=A7BX53ZmmxAMYzXkMBCQQopTU6csqxhQeemJX6EZqUIuHZ7iC/7b4jTwhze9vVGAxA
         dHFi0ZGsUan36ik+IwEPj7k56V9IklzdvwKkZ4vsDf1rj+wSV70LLzWA52tQKwIJEVoi
         OK1f/2fWrGgdtJRKsv6FQ2cvPOD9Aq8RoWpincIUzYgHf5PXaZUvYqwfzPaUwnZsb2F6
         ZIYLSe/qAWFeq+8H+c56dHJDNbb2PpkjR21kMMrR/w19r+lYqd/4TyiVybsUh4v5QxnL
         fvNaLHbzBBQSusKayVKhRxp7ASZxkaTE+rn/MNBZCGjybRzzPPyHUG+6CqshLW1PCDQX
         ootA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376059; x=1704980859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxGy7pLjWz6nitoY50e2aJeZJJqgkNuCQ+WC6P62+FQ=;
        b=lf9vHSegmuk2PQ8qTILec3nkiOF9p5BGNL4pUZ3GMOTXoqRgukh8U2PPab2B0LHgv/
         zK1jHPm/UArMd/my0DO5dGrwxcfQc6aQ9fpT5bz6NiYB4KphakaN8JURBTJF1DlDBKWh
         /+1fz9Iwv4utam27a1nGDpNQhDd0vG0Dbc509NWWWDTGYCgFPSisCws20yu57qKj2+La
         wEG8W7J6zz9h6lTvy1cIJGWBMWGAR/dueebqtXNK7+DqzxgaPc+4TqxTxhoLFQXbd6qb
         xOLk5eTrItH3muqpCwZzx9zsvcDFJpST3jIErYP29vUubEElv7kGOW84gSsUyB1saqOy
         NoLg==
X-Gm-Message-State: AOJu0YzDh8AXMauo9TjN2NPUiQC82DpYzVwpR9uusW+pX6HBLklKoBBU
	rgBCr/AjOHF1KnLxNEMZmTk=
X-Google-Smtp-Source: AGHT+IHjZB4c8LT5IHLe50DMbalsQ9CbaL2Y4/m+a8a1k9zs5tQH0Y5UKPao5FbMsaY+QyINqSis1A==
X-Received: by 2002:a17:902:6548:b0:1d4:1dac:9fa9 with SMTP id d8-20020a170902654800b001d41dac9fa9mr471413pln.72.1704376059493;
        Thu, 04 Jan 2024 05:47:39 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709027d9600b001d425d495c9sm22990550plm.190.2024.01.04.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:47:38 -0800 (PST)
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
Subject: [PATCH v2 1/6] ARM: dts: aspeed: Harma: Revise SGPIO line name.
Date: Thu,  4 Jan 2024 21:45:27 +0800
Message-Id: <20240104134532.536793-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
References: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
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

