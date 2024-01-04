Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D898242F1
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 14:47:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ch4ziyFI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5SZv3Pz9z3cVM
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 00:47:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ch4ziyFI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5SZk5qT5z30YS
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 00:47:41 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cd8667c59eso360362a12.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jan 2024 05:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704376056; x=1704980856; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJx2eUA4QrYnTkHv2f8bxgNQumbRSXupaTSMFkEsx/A=;
        b=ch4ziyFIBKd1Bxsb0vaBGMr5Pomsv24ue+WSllr/bvbAJuCwt7UA+GlXEE3duw/TPw
         nelrIGZuZryfUxMkrYLE1JzQPZwtg95NXAUnd0StfUME3qzAe+7FUDCYSKF4TfukogJi
         BhytqXG1RM0KkbwUvXc9CgyQT9zek50pT2P28MAV/Q3pJtvdDGqGiAxTKNh5m1Hn4o91
         mquX3dmDfISUlaAxcvxbWY/+AZfn5jrZrMcCC3hEm/HZDTs43IXJcz0x2YTWOfUXu6Y0
         qCDD15i15ipXXSfN2eIZM0k8abStM9H5QRMJjBv1PcxFlWA23Xw/FJHLAK7nReW8jRAj
         v2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376057; x=1704980857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJx2eUA4QrYnTkHv2f8bxgNQumbRSXupaTSMFkEsx/A=;
        b=g6m69Kcn6p8J5oxF7ErwMi8N+NcZcRE/QwSQ5nPHIP3pyXvz9T6f/ObIrhEkIlfQRJ
         zMSR+5JkitQglVGfZnD1YVUVWTQjlKTo3DXjstDnQlawmH78qJfa9+m07rQ6S58sbg9U
         Ok+UctFCDWcuD1zpwzTGrfPa4OyCCAiuqTds59G3x3adVRnwcrekrZC63bcDac7O9Coo
         24s/5SLI5XGxak/izYCKm75e5GoOZgxYeYH7p8YZJg9MnSZt7LqIZxI1OqaLJ142/lnI
         MsKz2JpJO1x/jclFHAtq8o7HTdgCYtFAgcb2xM/2f1mvGPIAGatqJArjwP7+7lfgoVM6
         vgiw==
X-Gm-Message-State: AOJu0YwlRypKaJATT2ABcN4MwNrJ5jr6npKTenPcGD89XHkX79ulHrZP
	lVB7h3EQ4vC/3m9HrgFf0Vc=
X-Google-Smtp-Source: AGHT+IGZE/NXOWgtttp9e1/3lUPaoamjSYTfEqRWxFDRN7DGmeWnR15SllW87KhGw6a8ee0ispOstw==
X-Received: by 2002:a17:90a:bb06:b0:28b:aab3:ad45 with SMTP id u6-20020a17090abb0600b0028baab3ad45mr530121pjr.71.1704376056685;
        Thu, 04 Jan 2024 05:47:36 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709027d9600b001d425d495c9sm22990550plm.190.2024.01.04.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:47:36 -0800 (PST)
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
Subject: [PATCH v2 0/6] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Thu,  4 Jan 2024 21:45:26 +0800
Message-Id: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
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

v1 -> v2
  - Add infineon,slb9670 information for tpm.
  - Patch 0006 - Add PDB temperature.

v1
  - Patch 0001 - Revise SGPIO line name.
  - Patch 0002 - Mapping ttyS2 to UART4.
  - Patch 0003 - Remove Vuart.
  - Patch 0004 - Add cpu power good line name.
  - Patch 0005 - Add spi-gpio.

Peter Yin (6):
  ARM: dts: aspeed: Harma: Revise SGPIO line name.
  ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
  ARM: dts: aspeed: Harma: Remove Vuart
  ARM: dts: aspeed: Harma: Add cpu power good line name
  ARM: dts: aspeed: Harma: Add spi-gpio
  ARM: dts: aspeed: Harma: Add PDB temperature

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 +++++++++++++++----
 1 file changed, 30 insertions(+), 8 deletions(-)

-- 
2.25.1

