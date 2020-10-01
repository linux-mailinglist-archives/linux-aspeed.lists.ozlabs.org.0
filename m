Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52627F68A
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 02:13:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1trB1QLDzDqV4
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 10:13:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=oO0WfMhq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Hq9VBLO5; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1tqx2FpdzDqSy
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Oct 2020 10:13:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C074A5C00CA;
 Wed, 30 Sep 2020 20:12:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 30 Sep 2020 20:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=mmqRcUlvPdUwSQM/x6F+Lvk29MhRVNZ
 Y0OId6LTaioA=; b=oO0WfMhqd7/SXXOpkm4pvo+CUM/mfVa0S/9LQpznEWngn7L
 pp0BMwLnlNeQX6AK1AaeMTvSe6uHdzjHNpNrfbQINBoDediIUxMfyrIEOjXkf9kW
 6Q8g7HSHoGwgHMXYV1mT40L0nOdaRCJJi1P8cQHW80tO8+20x0rFVrpGvg+tnbER
 MLAgDnRO4Dr0rsg4Ysc/DKiekVD0z+zFyxLFPPvgA0B8tqZ9TPX2IJ1gUGQvcn3/
 veGMQcF3n8oPVTZ4FTpQVGQtWSzQu1pR/KT/lcVbHsoLoxIhZfdljJVR7OOduSKV
 vXG887JOfL0Qjl1NaNKMrUfjQePncm9YfjYP/ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mmqRcU
 lvPdUwSQM/x6F+Lvk29MhRVNZY0OId6LTaioA=; b=Hq9VBLO5rOGiQyygLKdC4D
 npI2wsldxkFbJmNyZsGsDducaQYSd7YWUSFbtq/CYo+LKBZvsP/3lImpwAnoN+2t
 120kjqML3EHNEQAMmiR+m+s1ySUcosEztiLq3CdTJzGo1sKur+7i8DXXAA2yCuC9
 kjhllFwMETxWRB1ckvbIfOQSvSCV5j2JwoVyby8tKPakQyfbYMl6z8k8p19f2KKS
 EU/jbcz9vyjj/o79Za9og95bKpD8t2eaDB3lZkWxiU6wdMP0QxGP6uZakgFrKMKk
 6rkuFUg8WaGc+waZROyoIOA6+kRNvgSEESNydOf58BdOBZaXMpRwkr82mrLGWS6g
 ==
X-ME-Sender: <xms:Bx91X7su7hjam-0xm23UCihQ1Gcd_cqki62_nBAphXy9EG5h1LkNRg>
 <xme:Bx91X8cDwCFJueCMpSjErWxi7-55X0gP_8C6fl2qHJdzBSi2nn_beQR0oA0q26gp0
 CN9pE4-2fMMwb6kDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Bx91X-y9-ua34XWjr1AP1838iiPZeGiC4yoAokyMCla9rmMsIXb-mQ>
 <xmx:Bx91X6NR2KEiVwWJ6sEWfXUt9PFHP9NfS6-AR793GxKdHLfXcnlUsw>
 <xmx:Bx91X7_4-hq0dL2JfE7tG1mbOBy85BGnA-4pTIcDhQSxVPzPyEN1YA>
 <xmx:Ch91X2mB-zkFx8juQfFmrRsdGF2ESBYnEvSlwDJpZ_JWtz9gRuqZqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BF278E0181; Wed, 30 Sep 2020 20:12:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <b7bcc925-b0da-446f-84a7-1a564a1f4f83@www.fastmail.com>
In-Reply-To: <20200930090603.19891-1-billy_tsai@aspeedtech.com>
References: <20200930051113.32465-1-billy_tsai@aspeedtech.com>
 <20200930090603.19891-1-billy_tsai@aspeedtech.com>
Date: Thu, 01 Oct 2020 09:42:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] ARM: dts: aspeed-g6: Fix gpio memory region
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

Hi Billy,

On Wed, 30 Sep 2020, at 18:36, Billy Tsai wrote:
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 97ca743363d7..b9ec8b579f73 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -357,7 +357,7 @@
>  				#gpio-cells = <2>;
>  				gpio-controller;
>  				compatible = "aspeed,ast2600-gpio";
> -				reg = <0x1e780000 0x800>;
> +				reg = <0x1e780000 0x500>;

We took the 0x800 value from the memory space layout table in the datasheet for 
the 2600. Should that be updated too? Or are you just limiting the region to 
the registers currently described rather than the allocated address space?

Cheers,

Andrew
