Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9768A853E
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Apr 2024 15:50:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TlKqbo6J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKMjx6kLvz3cPf
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Apr 2024 23:50:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TlKqbo6J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 17 Apr 2024 23:50:24 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKMjr4nYRz3bjK
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Apr 2024 23:50:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713361825; x=1744897825;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ltyfGUT+Q1+XHGbLf8LZqsmChBW2AZtse+4kwOov8BQ=;
  b=TlKqbo6Jjc7BNP6MHATW7rFik/TafrWrNlxA+Ixfvb3c/CpHwrtj4FwQ
   UexsVCw7UU6wrW9YMT2wGpvaleexkftWNznibZliRBwutSdZgqkYtIdFF
   o3EnOIPmpQkw5JuHh/Y4HSzxUsVw5hQP/mdKnBLJ4SLmS5FV6435SVs2y
   ohyyVO5zEsDqpkZFNsGdgxCMYy7wvWlEkXbLG21IJ8VtGzcQT41e+bMYN
   PnZ0aRpYNObaQpOOn1wzAB0WdfMUrDjrTQuM//ogONdpCh6zBlFsMl75/
   SyCZLy1fQg0xTbWgXJvDt0Z4RZsm30a75BoeOVH+v7hOuUqRx4lpWrKSS
   g==;
X-CSE-ConnectionGUID: QaQQ7Qa6Qy+mC1We1z5gkg==
X-CSE-MsgGUID: nbAwK24nQUifGhvhtBqf7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20243258"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="20243258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 06:49:13 -0700
X-CSE-ConnectionGUID: 15UkjXbFQ0yniwze6OGHzw==
X-CSE-MsgGUID: lHfY7O6WRHO4OiRM3eJPng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="23059043"
Received: from molech-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 06:49:12 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] peci: aspeed: Clear clock_divider value before setting it
Date: Wed, 17 Apr 2024 15:48:49 +0200
Message-ID: <20240417134849.5793-1-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.44.0
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

PECI clock divider is programmed on 10:8 bits of PECI Control register.
Before setting a new value, clear bits read from hardware.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/peci/controller/peci-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index 7fdc25afcf2f..de7046e6b9c4 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -351,6 +351,7 @@ static int clk_aspeed_peci_set_rate(struct clk_hw *hw, unsigned long rate,
 	clk_aspeed_peci_find_div_values(this_rate, &msg_timing, &clk_div_exp);
 
 	val = readl(aspeed_peci->base + ASPEED_PECI_CTRL);
+	val &= ~ASPEED_PECI_CTRL_CLK_DIV_MASK;
 	val |= FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MASK, clk_div_exp);
 	writel(val, aspeed_peci->base + ASPEED_PECI_CTRL);
 
-- 
2.44.0

