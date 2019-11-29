Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E110D01D
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 01:08:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PFGt5H88zDr9W
	for <lists+linux-aspeed@lfdr.de>; Fri, 29 Nov 2019 11:08:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dSi7tOOR"; 
 dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PFGc4Sq6zDr8g
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 Nov 2019 11:08:40 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id r67so4728678pjb.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Nov 2019 16:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzWN4cL1wf43O1PtpUjZOF/nWFYMcUCUfWytZsUUyVM=;
 b=dSi7tOORl2Yu58MKpmTJaZq8PC6pMrxWZlc3OrbfzabvskelxTZoHB06vlTrnU9Bfn
 vObC6N6DPm0iY1OwThGpe2g5fXDvIecJOoZaTQC8IlmTASyCiTH/O8lS1PpvWI61zTx8
 O6cEiOKKdWoUV6IAl7fmO4uFrYKs9WYuktiGMTtBQ2j9g9q4/fjcV3cA3BHgy2jnzJuh
 fk4H+hPQgfX6VWg5VCPLTZx8UJPyLdy6pOq2eaCffPuUSnDDuxGTTG4QwSyxp7ln8hnD
 zPTOiPliJH1UVmPFPsLrVz3IwL94xHiQXmuroN0SawURcRF6ImWYphHDbjo/u0QuEa7/
 ngYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PzWN4cL1wf43O1PtpUjZOF/nWFYMcUCUfWytZsUUyVM=;
 b=Z7MRi1oi9xtIPalhf3Yf2AbAVGlTDvXiYXkDBc2NMfGi9sHsWZcSLOdmnASsmduADm
 LOp8HtUCbOwiTcsP8wiLRdKHSJL8D8rMFTCe58QGfRbOjxAeNF/GRhPWYj65MJr/X2MI
 JS2wy1ZasAZtOkwHlIARAFVcpQbnk/ELw0lKQRYDTJswdFDe2PZr3UyVsBVfEKII9qFf
 nLkywg9g8qvJjyLPLe5O/rQc8xn7kGoAi1CubG59SIfRJ8Up6LsZuyeyRRqgaPMd+yGw
 ySzmXEQHYVCxx3c0Xb5pzXIK5w4dcjgr/G2b2URdsePgOgb6jbLBjFaL+RDuJQYknWfN
 PdgA==
X-Gm-Message-State: APjAAAWC8NIQqalvSk2n6I6Jp7cVFPR/yerigQBiUasaFMtmWg6VmtnQ
 YKhPkrkLZTeW5QdNUL2nunY=
X-Google-Smtp-Source: APXvYqypDkqlvQWSySZaKfJe9FNPi29JX9+IyoO2gKYaFImONyEaQ2/LCAsDEoHGbHnhMZNnjhuHtg==
X-Received: by 2002:a17:90a:cc18:: with SMTP id
 b24mr14709846pju.141.1574986116875; 
 Thu, 28 Nov 2019 16:08:36 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d188sm21302075pfa.157.2019.11.28.16.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 16:08:35 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/2] reset: Add ast2600 support
Date: Fri, 29 Nov 2019 10:38:25 +1030
Message-Id: <20191129000827.650566-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series adds ast2600 support to the reset-simple driver, and updates
the device tree documentation for the LPC bindings.

v2 fixes a typo in the bindings that Andrew found.

Brad Bishop (1):
  reset: simple: Add AST2600 compatibility string

Joel Stanley (1):
  dt-bindings: mfd: Add ast2600 to ASPEED LPC

 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 drivers/reset/reset-simple.c                         |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.24.0

