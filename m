Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D128FD58
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Oct 2020 06:36:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCCyy2nCczDqYB
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Oct 2020 15:36:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=qBJyevLi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=cCAgUUAQ; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCCyn19xCzDqX1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Oct 2020 15:36:16 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5A965F84;
 Fri, 16 Oct 2020 00:36:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 16 Oct 2020 00:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=tFx9y1gOlAAhTEgT/PH0isSwFS
 +k2LV4WaIJDM4cFVQ=; b=qBJyevLiNRwhAo/COPdxdQwigdwLM9BDJS0Sm6HKWk
 lNTt+5NNPiWfAprigBF7N7mXmkbjFHIUPVbEYqR10XOctsppSA4eeYZmhSq1VCcW
 Yq/J0U9Yx9dyhg/LXL/ktOgs0IlPSRDJU6FTdDyDpBB/PXuJSI4CKrYku6Ge+oT2
 8ACkJfMANUN+mfqDA+C0NUbM7krcU+myOn1LJe/opu61bLIdSpZcte2dJ0zOE1CZ
 tlHqJYudkAE+5xwquFoupagHtMZ1SbUsjDPpZFSLpaZSc3MglD0ugFkSgkTsGxnH
 PQHr302ZMgq6CeQVUZIaXazLAWhKRcqNAi9F3rVENHmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tFx9y1gOlAAhTEgT/
 PH0isSwFS+k2LV4WaIJDM4cFVQ=; b=cCAgUUAQoAqnYRfF6dq3ZcLdwxo0BS10w
 vZ5qoKQTsYWJYeiEOjCNmR2BCnURYw+bFe5Dwixw/eZjW3vpQGPMqh7T3rOKvPf6
 HnelX6TDYELG6Pfs7qE5Je21fstTN7iqfoTAo4wiby6j+7+VbjT3eiH2Qphz6T8D
 aNdPnZ9cMbd0BNIhKwu6w+on/1Cs5de7pCJ+4fLnb7CWQLRnAk/6Nnjtri8sCyhb
 wwAIonBfSq8RqvmKrNNEIhqsgXid1WsZ+zrsZ4xQ2pUfQmYGwcCktfz05gyAyr3v
 yuAyCiGaEtUPlOXigd5rqopxbb7pUSPp4v4OMhVlR3maiUEG7zLBQ==
X-ME-Sender: <xms:OyOJXwpmMsNXlED5iDcMNWDpX6i32I1OewH4Aax7A1h1WPF7yGCIAw>
 <xme:OyOJX2qKUGkhmZJ4LiCBOslucfSjQOkvBSmSPK2Sybzq7tWlWbo5Meq53b9-c21Qo
 HzAyxZTtTdT1Aus3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieeggdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucfkphepuddukedrvddutddrjedrudektdenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:OyOJX1ODvrA-3lrx2i6JZOAEl7kbC_2qK5FwtLcgZmG6asxH9M6ydw>
 <xmx:OyOJX37ogbq8sOSxGyNeiftS70jZaNr6h9mgo1MfaSXfF2eEHOYveg>
 <xmx:OyOJX_71nPRFkOYhzto3gZdv9ZX_F2yBK2OYu9ci1WaPw8ln8UmAeg>
 <xmx:PCOJXxkqdQaw4134yjzKB61Pnb8ICZR0WLot1pLsQyubEZXjdDPisg>
Received: from localhost.localdomain
 (ppp118-210-7-180.adl-adc-lon-bras31.tpg.internode.on.net [118.210.7.180])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E764328005E;
 Fri, 16 Oct 2020 00:36:09 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH 0/2] ARM: dts: Enable ramoops for Rainier and Tacoma
Date: Fri, 16 Oct 2020 15:05:11 +1030
Message-Id: <20201016043513.119841-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

We're looking to improve our crash data capture for the BMC on some IBM
platforms. This small series enables ramoops for Rainier and Tacoma.

Please review.

Andrew

Andrew Jeffery (2):
  ARM: dts: rainier: Add reserved memory for ramoops
  ARM: dts: tacoma: Add reserved memory for ramoops

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 9 +++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 9 +++++++++
 2 files changed, 18 insertions(+)

-- 
2.25.1

