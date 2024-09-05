Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D396F474
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 14:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bTT35pVz3cCx
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 22:42:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725536938;
	cv=none; b=ZFWJPC20YA0OdFk3+AOwaYmBWCQWVLRKsOYXMZikpTaATZoKJbmEJtoD8ytl66d7oShmM7UQHbF+91RbhJTe5+PkYgEFrTqMjIvxoSvGOi4ZFlDGHGjhWWcHBKWSbPhRiwhVqVeLukGpUv2DXE5iolwOgbyZnIGfu8ZmadkT2JRFBDyG1idFTjb7Izx0wtIsSiQmAVeEE7/+3tVuQXKW3dkRxHO8kx2APMUawIr2r/aFynFLpXZ4lQobNqyJ2Ik6AiZ8PPptq4mTID5QgmYKUHGEKAoo8uY3qQYfQx/oj+Mr8YurLDtfgqc8FUrOZXDTn+jyq6s/iqB4NHLnvtxcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725536938; c=relaxed/relaxed;
	bh=VXgN600ePjNqVjIenDcqTOPDY3Z5mlMCyEO8M8sDoxA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lACGLWnIJuZYs1YCDrwGpS+e3545RnheeHBTXJcDqCwS23PCtU+S6WMHTD54gfeR3UDWUC2uhTJ9xX+ihCBNJQCqlxQlVW0PMpXcVP79jdhUdBax0kw24D49qGTtOoeiz8GjlvV5LuB+56sNEBcoMacbUXRVefD/uI7Y5UFThe4bRUfIuaY8BsRcg2DFIBVG8L1cQPRtV5DHnLuaTPHXHavGr9r2oKf/FpQSb5MrVoeUVVQ9qiIwJyohOGTFpgl6hNS3bRddq2172jxw3TYA5VwuWhdu4HSpNRwhlhB8/ma/FSno3LSh9gQEQgnJDw4VoBqSNAYvKdqdmDz6BTsFCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzyLJ6Dg4z2ysh
	for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2024 21:48:19 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 5 Sep
 2024 19:47:54 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 5 Sep 2024 19:47:54 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <andrew@lunn.ch>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>
Subject: [PATCH 0/2] net: mdio: Add ASPEED AST2700 MDIO compatible
Date: Thu, 5 Sep 2024 19:47:52 +0800
Message-ID: <20240905114754.519609-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 06 Sep 2024 22:42:03 +1000
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
Cc: jacky_chou@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a new compatible to dt-binding and mdio driver for ASPEED
AST2700 MDIO.

Jacky Chou (2):
  dt-bindings: net: aspeed: Add binding for ASPEED AST2700 MDIO
  net: mdio: aspeed: Add AST2700 support

 .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml          | 4 +++-
 drivers/net/mdio/mdio-aspeed.c                                | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

