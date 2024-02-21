Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6A85D3DF
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:41:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m5H1RYfV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfrrg0t2sz3cSd
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:41:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m5H1RYfV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfrrY59xGz2xwD
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:33 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e48eef8be5so286899b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508488; x=1709113288; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxPgBDv3C3dcuReLG+Pr4kZ7NGxk76ia560ll/5bMEk=;
        b=m5H1RYfVW3+DFGkYUfAr3Ndiag1LHaA/yOHSvQt8QTXEkTTyHDb/JPW4UNVdwFW1XO
         d8xT8sHBlUPIqohOHN1c8+AxyPONxePfhxtJWQaoRsCFvx8h5KK7GY2isRj8Ge3+ZBPC
         HGdgkNiSuwbDsOb1LgCDgoDDOmC0pxejFlWJpTm3FB6tP692xWSlB1w3auiPV2OF8WNx
         jpJcek++rCXs4AI3C8VNnoOn/o3DEg3BtAk/eSUjvsgOju4FBZdcb7AS99vmaKAj1Gop
         uTYebknoK0dswoflJFpRRhzItCE6pDVJm2qYZvLIKVpjMfp8ojNhp4mW7WgUEFsbzvsf
         87hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508488; x=1709113288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxPgBDv3C3dcuReLG+Pr4kZ7NGxk76ia560ll/5bMEk=;
        b=YazzdcOQVOoGfTYkWqwGccZnCJz6enAg8tZ8pbKOiCkLaREeGzQwpWpLxTt6IBSXCg
         fn4An1K3p/dVv1iKa1uTq1t+MUUcY9UrsfH/E99RJOXdCFvx6LYNsJrL03hMk16UQlHI
         UEkyrOGiCxbRmp0qrf2zxScJcfVw0WEDhgFS5IZYRIttByqMoartwKhnq+HEQzBiUrp5
         5SppOtK9n+1txBeAixPMb/q3TGJjxUX7ISALonXF4ophk3hPRUgnXAvVtDmMThPygbNr
         ID6KxtaH7kegR+O/G77rlC+7mByvs36st8E4mvBP8v3b/wkvZ5CA/j+SVTsdCY7U5NYV
         c1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyDmybPQr428shqglRTLX6ncp/LUj7YnoBKHDk8rWGfMlitcB0YCqHOmFHm7NsFX30jBOHKDP6HzdU8FEumLhnE5zKBmMfTBXbHInLRg==
X-Gm-Message-State: AOJu0YxMlqwAnLx3iWX0g6dFzZbqKxF6z+GinntO9tmLHOIMN5fXafFu
	mW3oLy+SVbp/1OwLwHFU1RdhcOVKKmcORgu9003khBki0OV/hvL6pPtG7dal
X-Google-Smtp-Source: AGHT+IEpYDF/aIErFO50W/tttHeceZ9QK7f/ypdE9/vLUtf1QQi2UI/UoCC3API4C5Z9wcpvGwoo9g==
X-Received: by 2002:a05:6a00:2d0d:b0:6e4:5cf5:1b5b with SMTP id fa13-20020a056a002d0d00b006e45cf51b5bmr10524465pfb.30.1708508488450;
        Wed, 21 Feb 2024 01:41:28 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:28 -0800 (PST)
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
Subject: [PATCH v3 0/9] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Wed, 21 Feb 2024 17:39:15 +0800
Message-Id: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
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

Peter Yin (9):
  ARM: dts: aspeed: Harma: Revise SGPIO line name.
  ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
  ARM: dts: aspeed: Harma: Remove Vuart
  ARM: dts: aspeed: Harma: Add cpu power good line name
  ARM: dts: aspeed: Harma: Add spi-gpio
  ARM: dts: aspeed: Harma: Add PDB temperature
  ARM: dts: aspeed: Harma: Revise max31790 address
  ARM: dts: aspeed: Harma: Add NIC Fru device
  ARM: dts: aspeed: Harma: Add ltc4286 device

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 59 +++++++++++++++----
 1 file changed, 47 insertions(+), 12 deletions(-)

-- 
2.25.1

