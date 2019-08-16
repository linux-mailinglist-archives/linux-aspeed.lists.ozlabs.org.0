Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8B90522
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2019 17:59:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697Lb6GwkzDrVB
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Aug 2019 01:59:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vTW0wZ3Z"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697Js55kwzDrfW
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Aug 2019 01:58:20 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 196so3326864pfz.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2019 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PoloVULM911anludKTQHYfSvmuLN6FTBR2hjXpDeBXY=;
 b=vTW0wZ3ZuNxw8rzOf7RKNLMdbJDK9Gz96Y1tf/keYFne0Sz53pJtgzLdxZG+sfluOX
 PosHcRRZxxTLnFtYkrtPUG/2bx+OOjICVlI+ZGngX20OncUlOi9p0E0WROb0yj7wP05H
 mv8cE1G3F6wzNiiasfpemOgmrTDKs/8LfQD2/p8NZ5scPd1CBrxlUoJNSafvN5ikxFHj
 HbfpKOU7sksv/B6NAmaT3X05oT6xBqlGydkU4DjRGtucdN/ERgH3zrpmrzFveHm7JGX1
 sq4CPUN+qZTLLxs3LpYB2LzXx/ywcNWbhipakKlwTByqmYrvDxc3m74O0IuX0VnVVcR9
 V/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PoloVULM911anludKTQHYfSvmuLN6FTBR2hjXpDeBXY=;
 b=IpqVMD2vqWpV+5pjV8W/PjbpciUZNv6wHbORGlvHFm8Vi2NQfFlMAFKYXeWn8+7Qdi
 9k4Z+fAaOVsyMC71DM4G/RtVBxRcKUCNIh9sYxIxLCJXdaMrK9U36kMkLFPQOgW6/eDQ
 YJW2RPwATdaXyed9O5RebZwLrFHrDPao63oXnJBstnY7+E0nf33Ujyv920vvTi+qkfTh
 XjAUNvzDwD6PTPx8cZNwfM1nZP0K2xetCZ5tgAaJD5polj7oWmxm1A+lQMs48ogG/1Zv
 dTsb0GaP4SwRuwkqde9DbEXbA2wTBv3rnkpKydG6PYMV8BAB/t8r2G8n9pkH2kwX6rq0
 ++/w==
X-Gm-Message-State: APjAAAXk3qk7dFAzUKiJtOKoYFu5C/f/t5hNveH32g0R7S2xZasRcZDg
 DPGLKMZvKyR4/TlRLn2ydws=
X-Google-Smtp-Source: APXvYqwO2QPstr1atjcPz6YfyQbIQS/NHnTkmgQZY8GHgLSuWsv1jS7yJiG0Xt0T9Ay9tYauuz+M7w==
X-Received: by 2002:a63:fe17:: with SMTP id p23mr8368278pgh.103.1565971097219; 
 Fri, 16 Aug 2019 08:58:17 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id s24sm5746052pgm.3.2019.08.16.08.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 08:58:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 0/2] clk: Add driver for ast2600
Date: Sat, 17 Aug 2019 01:28:04 +0930
Message-Id: <20190816155806.22869-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello clock maintainers,

This adds a new driver for the ast2600 BMC's clocks. It's a separate
from the existing aspeed one as the ast2600 changes enough from the
previous generation to make it hard to support with one driver.

It has been tested on the ast2600 evaluation board.

Joel Stanley (2):
  clk: aspeed: Move structures to header
  clk: Add support for AST2600 SoC

 drivers/clk/Makefile                      |   1 +
 drivers/clk/clk-aspeed.c                  |  63 +-
 drivers/clk/clk-aspeed.h                  |  76 +++
 drivers/clk/clk-ast2600.c                 | 711 ++++++++++++++++++++++
 include/dt-bindings/clock/ast2600-clock.h | 116 ++++
 5 files changed, 906 insertions(+), 61 deletions(-)
 create mode 100644 drivers/clk/clk-aspeed.h
 create mode 100644 drivers/clk/clk-ast2600.c
 create mode 100644 include/dt-bindings/clock/ast2600-clock.h

-- 
2.23.0.rc1

