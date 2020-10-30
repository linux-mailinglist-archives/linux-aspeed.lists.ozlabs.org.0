Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F629FC1A
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Oct 2020 04:19:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMnbY53B1zDqs6
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Oct 2020 14:19:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=QuKE+qlf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KE+i01IM; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMnbF403kzDqjM
 for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Oct 2020 14:19:04 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C1B55C00D8;
 Thu, 29 Oct 2020 23:19:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 29 Oct 2020 23:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=g1UFE2VfgvZHci7NuTUW5H0p/65rAXn
 S0ZULATTBK7k=; b=QuKE+qlfoPG3NTEYdxDMseJK/N0tt4z/T/NQD75of7L7Zuv
 5CdKrsrlX8zHdm2HM//x6ARWBPBSXrWmevcCtePQz1/xMVVm7CPp/o+pscpXO1L9
 8e0/L+mNmU8s+uvwGnVudRY6mKr1Ea+TLaVWmiyFFZOUDq5pvi5LILaaxkl/kmxb
 uxxCtDyC4J5SIoSre5XAae2cGmQWLL4/89o1kD5IUcFzDDi159Ldcr1slv9Er25d
 Ef6/Yb9yI8nJQdBuVu77V3zZd6XycYN/C4VlEblUOYJ93jzcWjBFrnTcG+K++aVM
 Flt7/NA/3QiASnH1zrKEXNQQcrYd2+ci8UnnkGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=g1UFE2
 VfgvZHci7NuTUW5H0p/65rAXnS0ZULATTBK7k=; b=KE+i01IM6OxLV2I2Hrfqk7
 LrrP9R1GiEAa1x3JwbmSASqlBvNkigPxUc1Bg68QXXey4GpTiqNcxL4666gPVZ6m
 0v9Ljmzx6xxmkdgMp6AW+XiJm9IrvKnikZUqIsBT/7PD3QPzEud//ZkrYh1cdvvg
 lhUsoy/HLUMVU6B87b83qR8vF/01gQlN2IUVUQS2rRGIQ5ykhlSm6d24vEt7TZMV
 kgNicwUoFow7RSCz9X8qP1JbMfX/UJNFJj5O4yp0lR9c+y1PoiimPNghwLt2ynDY
 18SqD17Bhs7/GbFPbiGFheQcD73DfuDQMYAW+0OBmA2XmzKBdmNd/DET1IVt+kmQ
 ==
X-ME-Sender: <xms:IYabX0BEj2z_ZcpK6fzuV4U3sYLaqLt7gUmJ8af_yftckVVUkTh5fA>
 <xme:IYabX2irR6OH42WrMaxTXw9bywxNcaWKNJ-TdreYpM0SFkhzlQV7SZ4_umeHoNOLw
 ys_pXdJuCV9UzAvEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeggdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:IYabX3nDwxSBj4Yicc-WLio1U5kpsesVMsqgvDoua3elByElxoHuwA>
 <xmx:IYabX6xcaB8zGSG-eNQpl4NcBBFrIEyBfvpOdxQBdWtxBgw5GyWj3g>
 <xmx:IYabX5TBhfUdcQmdxjpSWuY13HKasHxinSmClhxYbHuRXqrnAq5z1Q>
 <xmx:JYabXyLufK38dbWko70d-k2ezGZMu9Lfo_08PD4Bc44wgGtDrNxcgA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 16AE6E00AF; Thu, 29 Oct 2020 23:18:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-530-g8da6958-fm-20201021.003-g69105b13-v35
Mime-Version: 1.0
Message-Id: <c3b4c7d8-65fc-4196-b635-bf65ed3b44a1@www.fastmail.com>
In-Reply-To: <20201029062723.20798-1-dylan_hung@aspeedtech.com>
References: <20201029062723.20798-1-dylan_hung@aspeedtech.com>
Date: Fri, 30 Oct 2020 13:48:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dylan Hung" <dylan_hung@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH]_ARM:_dts:_aspeed-g6:_Fix_HVI3C_function-group_in_p?=
 =?UTF-8?Q?inctrl_dtsi?=
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 29 Oct 2020, at 16:57, Dylan Hung wrote:
> The HVI3C shall be a group of I3C function, not an independent function.
> Correct the function name from "HVI3C" to "I3C".
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>

Good catch. Thanks Dylan.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
