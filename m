Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C61EB1256CC
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Dec 2019 23:33:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dVCB6BrczDqkL
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 09:33:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LKFB3dzL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qG15kzio"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dVC21hw9zDqjM
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 09:33:01 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A48921AD0;
 Wed, 18 Dec 2019 17:32:58 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 18 Dec 2019 17:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=KbRgkj4TkHzAHUnUGVVnrmTrRsfMkSe
 N/TrcHi5KQlg=; b=LKFB3dzLTBhECvq4wBW7ZueCueXtEGOPSsZ2fBPEmscbwZn
 /6Ikl0ifFWYllxu+LjFInwq0SLVrp/w4WVZBKJrexxmYREH+UHQu6Fe/im8sNqIU
 c80vlOxC8HqrxiYJ0Yn/vlVTYcvznwTxf0+lD3ulM/1BPURFNxcl5Cml3WspK3Sn
 Zjvr8XXAxa5s24lNFDcu/C/eTEJzQdiscPkcVOYSE1+ztUScseF1FN5MyijBvtMF
 NRiJJVu0d1A/yjrh1OV9cLqsy4KzLQ86kVv5Z/dZZp3C5S0AweqONfQ1QDDSZjTO
 sNheorDaHpObCHQYGAtdEgvxxC0tsCu6/zqfX3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KbRgkj
 4TkHzAHUnUGVVnrmTrRsfMkSeN/TrcHi5KQlg=; b=qG15kzio99DV0br68gOrSj
 +lPKBUlBiMTKkSGxykb4R90Ym++mw9jiHMFE/LMbQnPoTBUg62kS6o8hvpvyarQw
 gB86CAHgTr8pRDJL2XH2HFMKYzl+KJimvnai51zeUBkazcExreAuSwQgVlLoCFO9
 +WkJDYsXv6cuShydMQe8Egw6wQkiNr2hpWCepKnFiB9a3bvonVHPNfX+WZvnCmvr
 qEO8DgdomGCVwhR7tS/qtRlw8w7rz9+Rol0tYrEmqV7OaoNKG7YNHyuh/22eAhrI
 aT5vroFofGcR92dr39ugZW/UqzXQILY50MO6b+T4hnfVkcA6By6X6vwBo+46+sJA
 ==
X-ME-Sender: <xms:Gan6Xe64RnW4gsCYfFCBO9Gat9Tl2DemPrzOKL_nzmAO_COh0aK6bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtledgudehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:Gan6XZXjmQrnq3qzS9iWotN8ehcCSpUwCIG-bEfgJWs_xTss0YhTVg>
 <xmx:Gan6XY38D-68WH430VjqlmjVpokqs4kC7V7sCAZzC1jQjiwKKxhL3w>
 <xmx:Gan6XYMqEOy21nwnJHlB0SZQRRIFes2xsTR7kPGB5EQ8TXe9ni2Kew>
 <xmx:Gqn6XR1hby6xlc5ihkkrvdcwsJeylpbQe404LUfaLv27iNosmqrKdQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 77DACE00A2; Wed, 18 Dec 2019 17:32:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <1a43e1cf-e723-40e2-a871-0cfb1b86a164@www.fastmail.com>
In-Reply-To: <1576681778-18737-4-git-send-email-eajames@linux.ibm.com>
References: <1576681778-18737-1-git-send-email-eajames@linux.ibm.com>
 <1576681778-18737-4-git-send-email-eajames@linux.ibm.com>
Date: Thu, 19 Dec 2019 09:04:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v3_03/12]_ARM:_dts:_aspeed:_ast2500:_Add_SCU_interr?=
 =?UTF-8?Q?upt_controller?=
Content-Type: text/plain
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
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 19 Dec 2019, at 01:39, Eddie James wrote:
> Add a node for the interrupt controller provided by the SCU.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
