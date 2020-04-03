Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72B19CEF2
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Apr 2020 05:50:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tmDb2jTNzDrdn
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Apr 2020 14:50:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=xCpnIFv0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=spNmuEnP; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (unknown [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tmDF4jM9zDrF1
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Apr 2020 14:50:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3E795802F5;
 Thu,  2 Apr 2020 23:50:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 02 Apr 2020 23:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=P0i5a44/PsPVXizK2loCZDTGox+XOyW
 9+9DooRb9EMI=; b=xCpnIFv0cZaUC0AT3DOLbflHBL9J8ZgbLYc5wbe/jrK9xf0
 2DrW2l0EHIfkNsyHA1GvpB7OtMjoRjcPThiu1r4wTCJJOnrfJyZPiFq4Dg3AJ6wf
 a85rCFiUQkwyYiwQOtCWvxoHxzKiqttkGod6I0yWN/TioFl+i1V7Hj5IQTYCwbQC
 znkD6kxL2gP/y+MCtrePHGlpybz2YLv9gsZyE7LY9Op1vYXzEstBJtZ4vRbOeaZF
 vTx+w1purQ9LiCNNN1fxdjz2t3ZXhaUKs/FwwOl8bY3vHTrntt2MYrpNxcxZxRzz
 UVhqrJO6Uhqo3L0+MijmP3fdZAPUbPcAaf8l0ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P0i5a4
 4/PsPVXizK2loCZDTGox+XOyW9+9DooRb9EMI=; b=spNmuEnPJL8Uu297qnnHKy
 rVOe2vFT6f/6b+xH026WDSohpHZdg8xnj9yghCLCKM/rgNrP0qcKPPvuEq3bz91c
 IkLsmP8xu1bPI2TfqfgUQUOHRQU3C9Lb1ukkQhXGAbCYh6bizNqEYrv9khjRe5wZ
 VpxfvrnYKrJYAH1X5aeawv1fijcB0QqbTnJEBIL2i8j7OWw2zsRljAEOfL4ISZ0p
 wo3BZ2RoeP9T46XJgve+IcLR4rEpIH8oPKxmdTjQEhUxhzf62WB+8z9+VUlPdAHR
 Li/tpyMFcYScbN0Byx2BjzYEvBksqSffm8w1fyHumWEm/LlV/MOVHc601cm5UMag
 ==
X-ME-Sender: <xms:abKGXrawh2OniH8S0iCs40jn3tE3MLaWUO1O7DzwPZMwVHiZwOiUmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgpdguvghvihgtvghsrdhpihhnghenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiug
 drrghu
X-ME-Proxy: <xmx:abKGXvlPkC1DxluARvIz4GaXXaHhMdSSm3xWLd9ypVAGbxaeaS2-Sw>
 <xmx:abKGXu3Aj5bepyhous-L-NVYVZy5zOZEmFcgFo4Z9CiCwBm8fmqjmg>
 <xmx:abKGXn1jySVFIH3-waYbwYInoEN1TIXY0UmbLkxz2p-O6vvw7YFerA>
 <xmx:cLKGXryKVaezoVOQ2k_ilBFTF_ZS0jkbQmrbG0_MwuNVc1LC4v28CQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AFA09E00B0; Thu,  2 Apr 2020 23:50:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1082-g13d7805-fmstable-20200403v1
Mime-Version: 1.0
Message-Id: <7734002a-181e-4baf-b9a3-af66894acc16@www.fastmail.com>
In-Reply-To: <cover.fe20dfec1a7c91771c6bb574814ffb4bb49e2136.1576462051.git-series.andrew@aj.id.au>
References: <cover.fe20dfec1a7c91771c6bb574814ffb4bb49e2136.1576462051.git-series.andrew@aj.id.au>
Date: Fri, 03 Apr 2020 14:20:21 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net
Subject: =?UTF-8?Q?Re:_[PATCH_v2_0/3]_ipmi:_kcs-bmc:_Rework_bindings_to_clean_up_?=
 =?UTF-8?Q?DT_warnings?=
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
 Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 16 Dec 2019, at 12:57, Andrew Jeffery wrote:
> Hello,
> 
> This is a short series reworking the devicetree binding and driver for the
> ASPEED BMC KCS devices. With the number of supported ASPEED BMC devicetrees the
> changes enable removal of more than 100 lines of warning output from dtc.
> 
> v1 can be found here:
> 
> https://lore.kernel.org/lkml/cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au/
> 
> v2 cleans up the commit message of 2/3 and changes the name of the property
> governing the LPC IO address for the KCS devices.

Ping?
