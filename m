Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4337A139
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 08:23:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yRMP6Mk5zDqLj
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 16:23:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UdN6jB6i"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pKthU7jU"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yRM81LsHzDqLj
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 16:23:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EF934AA7;
 Tue, 30 Jul 2019 02:23:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Jul 2019 02:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=xUyh/uFx5Pvf1Uq1MZFdHPn+B1
 1pIejp1FpFbo/nfyo=; b=UdN6jB6igo0Ty+DeyvZbWVNSAQaky7Dhy//EXdEPJj
 E3VwBUdaPoGSzU/o4BPLHloGuAkUn1/uTHkiKr3Z2Zug0YNBK9yFPehow5momf0+
 VEaWPHNe2ee0/hy7GYm/yzcjsV9KR13A3tOpiEGXirChmVzj+tCddxXOU42NNXRM
 Mefv7piyNaugsSzVZMUZRVXJMYM5MbfkaGRkuoG+8G5oozljCvgcreRNsz7v7R6x
 maXVSYXJtW4lISQ3cfhTTVP/f/81TShO9PfMm3n87blCXWCV4P8pL5DROHnmF5KN
 QKhV3PL0AB4ZHTuTm8TYHfKX0qBRk7xLYppERpmn9L3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xUyh/uFx5Pvf1Uq1M
 ZFdHPn+B11pIejp1FpFbo/nfyo=; b=pKthU7jUwLnIpxgW/pDXAhTnjyuXJJCrB
 EkpB7bOpdZyR2faU3ib1KCN9gxtnxVHtei3Apb1v94NkennpmFfXnYHlR96Dwyjc
 1puma2kqqmVej+v/mbBX/cIxfCuPePFEiWAznUXPzlh60ZOTnuAwNST4oQk8q9MI
 gANZEImUB7gZtYI6mH+qnhuB3DvvE02HjZHpTIssQUf2V3ZsIUdnadxD5eKGxQP5
 ZcDWmeT67Bv3rSKtb4W9uvmymXUFKAghBhF48XZ3avfWFFlzRcU+NHtnsg63U3gE
 /LHSGloyIolNFHBkR3Xfiiomxc0jcka1B7kNmkxFTxqdk1hgb7BNQ==
X-ME-Sender: <xms:TOI_XYrE5sZqkDUxk0kc4FPaANSiAFGzEmZV0dDyVvajl7mWFBURGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledvgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
 durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:TOI_XS6gMoGcyY4h7_EqJMkEStNAV6W1Dfwx_ej5hA50ggBnju-7zg>
 <xmx:TOI_XYN0is4b6LbHFvcjmzEjeD8XEWrn8A-jdM4nRUg93Z88G-0Wtg>
 <xmx:TOI_XUNXZGeGHXVnckNMX9Oy3YdgOcBmN5amS8wzyWFZNx357wU90A>
 <xmx:TeI_Xd4ayhocA9duTCI7EotOBL6jJ3BDN1iQ80mUnF4il8E8MnIfVQ>
Received: from mistburn.bha-au.ibmmobiledemo.com (bh02i525f01.au.ibm.com
 [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id CAE3880066;
 Tue, 30 Jul 2019 02:23:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v3 0/2] mmc: Add support for the ASPEED SD controller
Date: Tue, 30 Jul 2019 15:53:14 +0930
Message-Id: <20190730062316.32037-1-andrew@aj.id.au>
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

v3 of the ASPEED SDHCI driver makes a bunch of fixes to the driver and the
devicetree binding, including the addition of the AST2600 compatible string.

v2 can be found here:

https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/002013.html

Please review!

Andrew

Andrew Jeffery (2):
  dt-bindings: mmc: Document Aspeed SD controller
  mmc: Add support for the ASPEED SD controller

 .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 100 ++++++
 drivers/mmc/host/Kconfig                      |  12 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c            | 328 ++++++++++++++++++
 4 files changed, 441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c

-- 
2.20.1

