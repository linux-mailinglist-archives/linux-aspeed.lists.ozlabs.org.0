Return-Path: <linux-aspeed+bounces-1228-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1882AABD5DE
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 May 2025 13:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sDj6c19z3bmH;
	Tue, 20 May 2025 21:06:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747733770;
	cv=none; b=elHhtkG/alcMcWGOKXaXx4824ZHdjddTlgiGcYqNiOqH9pZvNiG/dTkpBuFx8n5iJ+aOZ3j8JGa3N0QA7mHmqcV1opy5PPOrJ54HNbnHf2Vlp0fM6c1OFbIA2xT40ljZMAriAWXgHyUNyo/HNYMeOxY5AAZmLPZ+vrLO1VpiaPv5+ojWYgS8vERYP+ZN4sF6VZZPiXMt8aPfWTcTW8r258bzdqj62+Yzj7/UawrcxGzarFlUvn98SrErMWqxvvbnL0J583l1jt+jhdMczmQ6IQGnU6hkYMABf04DL7lg22R+EiYwHYR1t3wtGcmwaVXSLtXhletEc1OjCJ/8QjFeig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747733770; c=relaxed/relaxed;
	bh=gLHXrGEydNLQezPDQp5GUWXDrkfxB1GnR6UV1efx7Nw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B6hMfoBF4Wn1yd9+nLbG71fqjO1RAbomvY0m/gpjho64zEnk+sk3l9wRBElSRAgptdXVvCNaO6I6MN7wdFd4LJtBQ7senyoGp+6QgFFxfwRcWgc0BVbvLWuSQua4zbOsvFJ4fRK+Y61Dr1oGjMibcOKxdbeTCgsRjCRUwbiyVXRma3YJgpGx94u/9okC6ahfvTlTruJsWv2PvX77cVCAlY5j8omTKl26/rFanJh/Nh/NwPCnwIha5jqxKiQ+6y7MXI8x0Euou9DFbLRW8HnLSM7vQwMBauLCY2pTtZoo9wzTVld22NagxoUkHeWz9rzJ6GYesiNxdycX9y4MUhP3NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1qDn5jDfz2yrN
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 May 2025 19:36:09 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 May
 2025 17:28:48 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 May 2025 17:28:48 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<p.zabel@pengutronix.de>, <BMC-SW@aspeedtech.com>
Subject: [net 0/4] net: ftgmac100: Add SoC reset support for RMII mode
Date: Tue, 20 May 2025 17:28:44 +0800
Message-ID: <20250520092848.531070-1-jacky_chou@aspeedtech.com>
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

This patch series adds support for an optional reset line to the
ftgmac100 ethernet controller, as used on Aspeed SoCs. On these SoCs,
the internal MAC reset is not sufficient to reset the RMII interface.
By providing a SoC-level reset via the device tree "resets" property,
the driver can properly reset both the MAC and RMII logic, ensuring
correct operation in RMII mode.

The series includes:
- Device tree binding update to document the new "resets" property.
- Addition of MAC1 and MAC2 reset definitions for AST2600.
- Device tree changes for AST2600 to use the new reset properties.
- Driver changes to assert/deassert the reset line as needed.

This improves reliability and initialization of the MAC in RMII mode
on Aspeed platforms.

Jacky Chou (4):
  dt-bindings: net: ftgmac100: Add resets property
  dt-bindings: clock: ast2600: Add reset definitions for MAC1 and MAC2
  ARM: dts: aspeed-g6: Add resets property for MAC controllers
  net: ftgmac100: Add optional reset control for RMII mode on Aspeed
    SoCs

 .../bindings/net/faraday,ftgmac100.yaml       |  5 ++++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  4 +++
 drivers/net/ethernet/faraday/ftgmac100.c      | 26 +++++++++++++++++++
 include/dt-bindings/clock/ast2600-clock.h     |  2 ++
 4 files changed, 37 insertions(+)

-- 
2.34.1


