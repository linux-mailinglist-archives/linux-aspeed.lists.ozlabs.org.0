Return-Path: <linux-aspeed+bounces-2388-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C8BB5C64
	for <lists+linux-aspeed@lfdr.de>; Fri, 03 Oct 2025 03:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdBfY1zMdz3cp1;
	Fri,  3 Oct 2025 11:59:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759456741;
	cv=none; b=AV3lYDdU882bZRFUkqmiCTLHSmqh5oEc0gi/4nl4+lcfpQwDnN620u1kaWDD5zOfQN1fMDedj1oRLP5HIWTmEN+G4XS0P05qkPW/KZS9PJuBY6TgwHjQ3hSYtaqN0adDkL6YPwBVCFyIdHOE6lui+IKohKeLc+PVXjqq/QGf0eh13tarP6QLrqUafdolli/wDTWlpeaynRODeY+oP4PKWN7isDvJkQjIhp/hGawilcOVJ+Ge8J9eCAYUzuctk1oy5GAo0TrmVEajjSM0/Wb0+FVHn9kB10r284y3OYPdfhgkmoe1J1mSEWK32o2bDrYTz5Fe8eI/k8Gh5UniS6ljiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759456741; c=relaxed/relaxed;
	bh=sU3bZ3yajk98uIYpkUjxdudOFWcKYv8+jxfnMTTbsKw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lgaF6wmPGYbCjtjRu7jSPLdOQR2YzGj1HFQ+Xh8R945Xu4d/fhqSBQS5KfvB+O6tvDVLcxgNnpUDVrB+gQ45xUUFPzGSlrqvgiveLwtQx9Plssqo4HtPaE8NP58EY3quPzF2ke7Jj9a7GePmiQJRaMDWfbvZ3tqY0eG0UP7ZPQa4LK7duDi+B13sER12OC/DHVwz3PwcEb2IETxHyME/DmOHvaRRlwY7+gO2nB1APfOnpiVoJoUnff1jbYJCpXXI2AZufTifjHID6WSCN150aBle9q3lSLJzsMnhIyLzxte6CXCGXJuruBpLdGcWAvwYUF39ECdq8G1uDfjVYX9zJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdBfX4VNmz3cnv
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Oct 2025 11:59:00 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 3 Oct
 2025 09:58:45 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 3 Oct 2025 09:58:45 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add video reset to aspeed-clk
Date: Fri, 3 Oct 2025 09:58:43 +0800
Message-ID: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add missing video reset to aspeed clock controller drivers.

 v2 changes:
  - Add patch for drivers/clk/clk-aspeed.c
  - Update index of ASPEED_RESET_VIDEO

Jammy Huang (2):
  dt-bindings: clock: aspeed: Add VIDEO reset definition
  clk: aspeed: Add reset for HACE/VIDEO

 drivers/clk/clk-aspeed.c                 | 2 ++
 include/dt-bindings/clock/aspeed-clock.h | 1 +
 2 files changed, 3 insertions(+)


base-commit: 7f7072574127c9e971cad83a0274e86f6275c0d5
-- 
2.25.1


