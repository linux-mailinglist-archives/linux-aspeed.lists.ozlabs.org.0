Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBE919FC8
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:00:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mzOG+RmS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qGQ3yKWz3c2t
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:00:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mzOG+RmS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qFv6WFKz3cX6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:19 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fa2ea1c443so37383155ad.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471618; x=1720076418; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T0OhsQN5t5Oh03T4naXnIdsse8TZX5DxNTBRUz9bDzw=;
        b=mzOG+RmSfITanslkt4BqSPGaP+rKjR9HfFDlcl129WgHZDs9/k/R86FV0/uRfXx9Lm
         yvNjra4wftkBxsIOOTOcAJcf5htkzLSoYkk9DM2NI4OFv+fKn8lJlkBurx/ItfIxk8xQ
         NbG7nUmlpKrIyvu5va2KRZaAdmv+Z2muMoNW4RpenTKk1LBa5q0fDdUeUVJPVM/ji4az
         RUeA3VnvHNSv5VrXV/OhJ+8EQY1vYQp18tEmd+3Av863Sj9ct5F3rgR+Va5bUv86XkfE
         r2Npj4hvC+D5/qoYMtVU0q9LLEBrHDaxRlE8aYXaCTcVB2xp6TIuXDB4zfUKegmosodO
         KMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471618; x=1720076418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0OhsQN5t5Oh03T4naXnIdsse8TZX5DxNTBRUz9bDzw=;
        b=vabH9mHdH60tuOfemxkmPpbpNSsl84u3dnrO+MF7tgu1WhKeOlYX4T0965i+T4cTth
         il7PCP4NBSN0v08Z31xoi7E2tlDxd/KEaLw9aH2E8tcbk/GnxLPcBsNi3EVlXQPXHRoL
         Y87IsOfjTtAU91jPvis9BsJudyai8brH8GKsZdNaEtZvp4oq/+79ThgCFchTzIfG3Uf4
         dg5G2/USIqoXxGad1/WHK0nLSsi6NgCr+mcz5EXEYUiEW8VwYyUhQK6Fpi3OD0EuHAs6
         DGa4UyOasbviPIhkgSccnWtXrgRVjgxRl3cvIcQ9k66kj9Ys72Dc7541lcO4ukTAn39y
         3eLg==
X-Forwarded-Encrypted: i=1; AJvYcCXkw8fbQ2l0y0shoIyTRlQv029EzRFpBD1WLEMj0bs5lU5zNDiFEozD3HZlKfryFFsrIi/ww+dtm9jlMfhH4nbJvmBZBEzKrV1Q5Luiyw==
X-Gm-Message-State: AOJu0Yx0PuHcCJaMH+AVN0MStmQhQA3ftk6G2u59mrc9D3FEhYlRSSXZ
	Uw6Xq8oYIFKhxEhucAk+8Z6qiNl5OuRvemD348Qtec4DXQNj4PQs
X-Google-Smtp-Source: AGHT+IE0ZWH2brv5TqLkV8Ycp8Au/v69jktjH20ef/ZyIwPB3DwXodf/6cTxKkv5xd2cJyzExt//6w==
X-Received: by 2002:a17:902:c401:b0:1f9:9a24:dc29 with SMTP id d9443c01a7336-1fa23be2439mr156075125ad.24.1719471617596;
        Thu, 27 Jun 2024 00:00:17 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:17 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Thu, 27 Jun 2024 15:00:02 +0800
Message-Id: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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

Base on: https://lore.kernel.org/all/CAPSyxFRj0twCJG6Lr5UZpznrUHyd_L0Reo=kZSFwCw3FNQ+x+A@mail.gmail.com/

Change log:

v1 -> v2
  - Patch 0007  - add fru device
  - Patch 0008  - add temperature device
  - Patch 0009  - enable mctp controller
  - Patch 00010 - fixed dtb_check warning

v1
  - Patch 0001 - revise hsc chip
  - Patch 0002 - add VR device
  - Patch 0003 - add sgpio name
  - Patch 0004 - add ina238
  - Patch 0005 - add power monitor xdp710
  - Patch 0006 - remove multi-host property
  - Patch 0007 - remove pca9546

Peter Yin (10):
  ARM: dts: aspeed: Harma: revise hsc chip
  ARM: dts: aspeed: Harma: add VR device
  ARM: dts: aspeed: Harma: add sgpio name
  ARM: dts: aspeed: Harma: add ina238
  ARM: dts: aspeed: Harma: add power monitor xdp710
  ARM: dts: aspeed: Harma: remove multi-host property
  ARM: dts: aspeed: Harma: add fru device
  ARM: dts: aspeed: Harma: add temperature device
  ARM: dts: aspeed: Harma: enable mctp controller
  ARM: dts: aspeed: Harma: fixed dtb_check warning

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 146 ++++++++++++++++--
 1 file changed, 132 insertions(+), 14 deletions(-)

-- 
2.25.1

