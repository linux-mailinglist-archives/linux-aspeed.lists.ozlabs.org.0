Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2AE83E73
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Aug 2019 02:38:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463CKG2PDczDqqD
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Aug 2019 10:38:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gA9Vvp23"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aI2yeZNL"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463CK71XtDzDqpG
 for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Aug 2019 10:38:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49ECD2556;
 Tue,  6 Aug 2019 20:37:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Aug 2019 20:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=tekQgJr6qSz/+W1IqdMF+U0YgF
 ytbV3UNOGCshAhIFA=; b=gA9Vvp238GgD8WvNh25Nh2WviEvR1tSf9vt8SHsPqf
 mvc978ohwcSe1/MCsLGoHMOYn2gAqnXB3SgsoeiCJqQKO/GblrLvWG+sM5pJslZI
 MshuJhEUP7oYrPiB9HPUhIiD9xPnmaIAiwbvboQyLxKnDzbuhgQexTha5UG85azV
 X4ZHqu2+r6qFY+c7B7AcouV92CqeoP59lssxb3sxscKf4Sb6nnc3vygKyRbV25W6
 k6ITIO0w2LLI1PGALHlJa57Iwd1VIIDROLN6CnyDGV5dIBtPvd3Kjf0R1ZSoMZE/
 akrPl0wt8nWSDLCqERfBeDMP6GoZCBPtCoyVmtn5d3cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tekQgJr6qSz/+W1Iq
 dMF+U0YgFytbV3UNOGCshAhIFA=; b=aI2yeZNL3PoeqQMek0jjjEKn9QrhPGipC
 HleCz3UDIMsddxW6TVI6nXUOxrwf76aG1/vp4fu9chL1PS7ICkx9CugGadgFPdFt
 pPNkkg+asTnpeHEEKkNXU4D/F+bfd6LPaIUexwThyoVsGep9DC9q7XSDXjful/Qx
 /TJCffMba9MYviuS/g8EWHYGao2eRaIBOAFq8iZNaFrn0k3kaJ7Qk3P1bCpmBB4K
 Vd2OnlG+/ZL3f1euoFNfyVIBLRgLZhwckN6qeb3lum599tj29KZtMo99n0GOn62L
 VyPrkrsA0em3egkPkqjhJbwpND61ae/u4M6OTTQCWh7pFpa08ypfg==
X-ME-Sender: <xms:ZR1KXQIykwBpiZFpp4cttIbn79GQw1b-2q7WCIXxw6Oa5rRVaEuv7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduuddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
 durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ZR1KXWKOdCyo2cKMurfo1BBUwnPDZIXIxCyuKxTOcesAPbUjO1Kaxg>
 <xmx:ZR1KXbgUpXe76vTrxh_1h5dbZMx9VqLP3bzJW-uM7dhudkxE9UB2Hg>
 <xmx:ZR1KXQMz-a2FKn5GOJsmH_6fPUScfTeYNpoqHWal1kHpTFdtMJlKlQ>
 <xmx:Zx1KXUxsN6qDKRIvMqZEyrfQloS3h44v7IJDO7k_MgmKxaeMMuBCuA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15E4F38008E;
 Tue,  6 Aug 2019 20:37:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v5 0/2] mmc: Add support for the ASPEED SD controller
Date: Wed,  7 Aug 2019 10:06:27 +0930
Message-Id: <20190807003629.2974-1-andrew@aj.id.au>
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

v5 of the ASPEED SDHCI patches fixes an error-path cleanup issue pointed out by
Adrian.

v4 can be found here:

http://patchwork.ozlabs.org/cover/1141949/

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: mmc: Document Aspeed SD controller
  mmc: Add support for the ASPEED SD controller

 .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 105 ++++++
 drivers/mmc/host/Kconfig                      |  12 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c            | 332 ++++++++++++++++++
 4 files changed, 450 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c

-- 
2.20.1

