Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E44686482E
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 16:22:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLwy2hndzDqVC
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 00:22:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="D4kYOq39"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zr6KNcoW"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLpS3b0kzDqRq
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 00:16:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6D3B4160C;
 Wed, 10 Jul 2019 10:16:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Jul 2019 10:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=pU/ZJD/W/LSUZ7docvxRW9NDp5
 g+z+9zh0aNagTZBXU=; b=D4kYOq39R5yaReEh7G3luGqW0UfZE1/qxpun4Df9zW
 XJ8vi83u3o4FLc10yVRjN+VlUylh1w1Ac8Aq2jkT9vNeCtkrEAJpTuowmZ+yIIIg
 RyzNNtA0VG2pGbXG36JelnF/I856XSBsG8k+LlTkvmkShNkODlK9uCE+hqJetJmQ
 GIcsjRN4KFRhk//k/A/92jU/Azev63qGN2INs4ThIg6u8Jb+RW8ubUkiqLCLdi36
 QUgIknlL0yiYToxpmes27ZNRJi0YHQNNugln4XE0ym1ECsY/TJTy21tUz0nXkmk6
 3ZYO8vhljwC0DoSquMzybm1hRaTkKJnx2X1g74tasypg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pU/ZJD/W/LSUZ7doc
 vxRW9NDp5g+z+9zh0aNagTZBXU=; b=zr6KNcoWBQzAjCHN6n23n3x+KoCEcsfVm
 ydGRWqXpXdOwAHa4yX+f2V1y/fAmEtY5bd23ZY8pLs+wBfTlKEKzKXpAYqkScBqH
 4RPiOocJ2C0TRfTfzU6ChCQ/hHA60ZdkUDLHz1WJONm2E0CVCoH7zPFTgCbHAtBd
 QNxc2PSxZGU2ITJGPKa2AA4bS+VaiEKXJLRuqQV3b0msjvdiWtJ3vRu8eIwsjH2b
 Bjc5GKCunyIvHW/LEFIJqloJx1901e0xnqf4tgZ5DDX6ou7Z6dwychT8Tdn77eET
 KLSSNy9Q4rfJTX/mPOr6Oiii60WDSddjTjw0d7T20YW3fgYMMp30w==
X-ME-Sender: <xms:O_MlXcjzK-xLWk4cI7qJv9Qw34H1oPMYwl9db4l3SnZa0xrdVyEHpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeeigdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepudegrddvrdekhedrvddvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:O_MlXYzj6lwL8H5aVd3eLWJCL8CLQ22NXh0Quhg1AXqkNYcMEOXNbw>
 <xmx:O_MlXT2X8Z_GnJuzF12_9IifdL9fmLyPvmZzpNWemX7cSpb8o7Vq7g>
 <xmx:O_MlXclJBRzqINO-vg202mwBT4QvqGAXLcWoaDCsaQ74b2HCPk2NTw>
 <xmx:PPMlXYR0R3tjk-ZoC-ip6q7Tlxv83HZhK2kcnsRFr_gT5A5dqVprSQ>
Received: from localhost.localdomain
 (ppp14-2-85-22.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6E2FC380088;
 Wed, 10 Jul 2019 10:16:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH 0/2] mmc: Add support for the ASPEED SD controller
Date: Wed, 10 Jul 2019 23:46:09 +0930
Message-Id: <20190710141611.21159-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, ryanchen.aspeed@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This short series introduce devicetree bindings and a driver for the ASPEED SD
controller. Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: mmc: Document Aspeed SD controller
  mmc: Add support for the ASPEED SD controller

 .../bindings/mmc/sdhci-of-aspeed.yaml         |  91 ++++++
 drivers/mmc/host/Kconfig                      |  12 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c            | 307 ++++++++++++++++++
 4 files changed, 411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c

-- 
2.20.1

