Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84563868645
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:47:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nGiVKKXi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL2v58mtz3cRv
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:47:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nGiVKKXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL2m2YS4z3cNl
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:26 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dc139ed11fso25382415ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998444; x=1709603244; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Bi8JUt9nb05E2+iuy4wVbc0ulD53LZE12DFVp8HmA=;
        b=nGiVKKXipj2i1jyaox790z6fYGcMDKgsj2mYSXtX24Vmx46MSok+JZgheutEgUIKxK
         OrD1zHkKr2a4SdEPtMx/Rw9RZfK48ScSSw4Zb0zo2yIsD+1uQ1VqXV1Zj2ExJoauWBCj
         C0u7zhP4DxHjG66MgwrWOxV3vdUZFQdP+t9f+R3wuE869vd16tf5W54dCZx3ZQG/pkXE
         YR54TnIpyBKR6JHlLVQLiMTT+8TE4buVJT+7hrtMQ55Z7iGuqhiCdBb3xe7uiFO1aI3P
         ZKDLLWQ7a6ytxty+YrknErH0TDIsoiSRdqJ2cA4nP7yNf1i5zkBGeITGLDSMn4UBE13n
         fR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998444; x=1709603244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Bi8JUt9nb05E2+iuy4wVbc0ulD53LZE12DFVp8HmA=;
        b=NCZ0DXknXA09IVITheOiX2ezcPJdKk3gj20lQcSV91K0CHURhsn7HH3dVMBISJQyQN
         8DOHBPSKNw7Td3EXW4jowGsPgMHionbkWRNnc6ibRHNskAPTtWKkhvxKaXdCGZF8uTAl
         bawCYHyBRSCNUhKrJUT0+G561Lgsb+XId+17NvHHr6C0dBehPzMjB7if5xf8KnzOHhIa
         Z1atTfet/h6mB5b3NyDAtexnpFxwFU7e6+eo0I+JCZcaamU1PdeXgVQavc7b1V+azlKW
         kqX16zuZZuFeSABW4+vgpDPsjGXQzgC+6inr6S2yzdjSigTb+sZEV8oEKrNYWRxLwC0B
         b1xw==
X-Forwarded-Encrypted: i=1; AJvYcCWYecBsaNGiepGSqYnnPy4ZBOCEYf+5zRMIltFQh8j9f+KDyiq/GwsaF93c1icRLUGeUjw/Y7t5sFAITaxT2vwhiWA1fvzEULT4HhVvGQ==
X-Gm-Message-State: AOJu0YwclTwHunhl14Y1J7sy7Db4J6nh1P9vl8GKD0gmziLGiIKUEh0L
	6SeqyoYBBN4G6rmqtWaHlXoXHnTmETqT19TZmfm9dQZYsi9rkj3C
X-Google-Smtp-Source: AGHT+IEnSIvF4O3ektlcPRgviqqNsyJ1pvW7GtmYokpf1hZ02p2IuY+epU/RcrY/7nLYnBtMc1UFlQ==
X-Received: by 2002:a17:903:2347:b0:1db:8d0a:cfa9 with SMTP id c7-20020a170903234700b001db8d0acfa9mr11514913plh.6.1708998443948;
        Mon, 26 Feb 2024 17:47:23 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:23 -0800 (PST)
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
Subject: [PATCH v4 00/10] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Tue, 27 Feb 2024 09:47:09 +0800
Message-Id: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Peter Yin (10):
  ARM: dts: aspeed: Harma: Revise SGPIO line name.
  ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
  ARM: dts: aspeed: Harma: Remove Vuart
  ARM: dts: aspeed: Harma: Add cpu power good line name
  ARM: dts: aspeed: Harma: Add spi-gpio
  ARM: dts: aspeed: Harma: Add PDB temperature
  ARM: dts: aspeed: Harma: Revise max31790 address
  ARM: dts: aspeed: Harma: Add NIC Fru device
  ARM: dts: aspeed: Harma: Add ltc4286 device
  ARM: dts: aspeed: Harma: Revise node name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 63 ++++++++++++++-----
 1 file changed, 49 insertions(+), 14 deletions(-)

-- 
2.25.1

