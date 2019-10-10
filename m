Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70CD1E24
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 04:06:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pZFS3zTXzDqbW
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 13:06:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Grg3rMCD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GvX3d3NO"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pZF12Pf7zDqZG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 13:05:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C66B21E29;
 Wed,  9 Oct 2019 22:05:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Oct 2019 22:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=j0nJ6T39mBn7jdktZT6Zi6X9sd
 fIshRqVoX28oscb1o=; b=Grg3rMCD3oBEZNUMpdLMPocNMItAkpBFGgUsksSuhr
 ur9gtvrXrNA5jSZrwrqaZOdUnenU8g6XcXo2YPeeH2FWM7uhkf7BTK+EAbLo+DbF
 RNIBDr7kZJl58FEd5i6gl9wLDBztZY+mwP/MHZgZ53S30kalDB6HKKvkDljeoGu0
 ESzuUX0F8Ihxg3L/NnwfCshobLMTVw0CnQWmtBIFsBWCtKPhlYxSBCk4N7Kj7/42
 Zjqsa41Tzsk6McYk5pCOo5Dbl17LmHGpXAirYM5WpfYorShOcwtQgrw7Jk7gBcza
 pqHwWLx0lxGzbgaF7+RHPFonEsv8bjCrGs3GRYkpm0Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=j0nJ6T39mBn7jdktZ
 T6Zi6X9sdfIshRqVoX28oscb1o=; b=GvX3d3NO4LpcMPH3fnKpwpu3sSnikOWpy
 BSzMdsbTXEu33S9MIV0RGsTRxod01XuiuhQeUq0BsfbDJLLfs2bjKRnFc+tro2zP
 sLelAZj6Yx+UdwZ53vLrqAhatmrs96aRJk+AfJ36dAmujrQtHvFJoUIRrM9v7Y+W
 O/bS0EQOgcyXBT9ut+RPX+aIkyyFm4hOao+NXmNJF64mS8+hUT1gJ13q09VwY24w
 Yzo/Q4N7VA6e7Q4g3HcPJZTb+3oi07Cc5KOqJWpuAXLd6ouk0uMJajtc4n66pr/0
 12hJs9kJ4hzPrGDe03TTe/P0ME16pQ25MKRHslaWImKWtySuFMlIw==
X-ME-Sender: <xms:AJKeXcSdWl408cda4MuK2rbaRDqUfONrCFbRzETcpJeSj_ugEoDBxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedvgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddvrdekud
 drudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AJKeXVTPykFqBY-AgGPxHXqScOD15duqhBzxy9PXbKuiJuzXMqd7pg>
 <xmx:AJKeXe4NMpZ-dEwnkcFg2ywhVq3IHJX9IHQZYKF3hkTkg7crb-6WNg>
 <xmx:AJKeXe-OzahKpL4FaXG1Bcerml1DFJIDGn2jgwpQNwIMZvME9VeVpQ>
 <xmx:AZKeXf3y_VHgP-2UDPJ4b6BjJT2PW7Y2KcYOOKZS3ydLJS83kuDiKw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 07A12D6005E;
 Wed,  9 Oct 2019 22:05:48 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-clk@vger.kernel.org
Subject: [PATCH v2 0/2] clk: aspeed: Expose RMII RCLK gate for MACs 1-2 on
 AST2500
Date: Thu, 10 Oct 2019 12:36:53 +1030
Message-Id: <20191010020655.3776-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series is two small changes enable kernel support for controlling the RMII
RCLK gate on AST2500-based systems. Previously the kernel has assumed u-boot
has ungated RCLK for networking to function.

RMII is commonly used for NCSI, which itself is commonly used for BMC-based
designs to reduce cabling requirements for the platform.

v2:
* Rename macros and clock names based on Joel's feedback.

v1 can be found here: https://lore.kernel.org/linux-clk/20191008113523.13601-1-andrew@aj.id.au/

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: clock: Add AST2500 RMII RCLK definitions
  clk: aspeed: Add RMII RCLK gates for both AST2500 MACs

 drivers/clk/clk-aspeed.c                 | 27 +++++++++++++++++++++++-
 include/dt-bindings/clock/aspeed-clock.h |  2 ++
 2 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.20.1

