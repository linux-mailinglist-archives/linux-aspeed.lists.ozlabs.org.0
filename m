Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B926D05C
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 03:07:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJhp0QXXzDrgH
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 11:07:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=AuwfupaL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ToPW/csH; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ6n5yt1zDqPR
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 10:41:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 058515C0B65;
 Wed, 16 Sep 2020 19:45:22 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Sep 2020 19:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Bh7AjQquAwy7lA11o8AfyIIMeICi9Eq
 6sKvm7YtZ9To=; b=AuwfupaL+f8yySNft0k+QJOZPKzK6RLR+KmHP+I6oNq/Sn0
 RuGh8205aBbQa+nvleMd51A8Zd9cybArzUjg0Oq7WwQK/EXpE0veC+8EhLkRWXXz
 aFgpIJcNROssTn4xAy9kQ/ADzuKbPJWtMpI2dEr35mW3r57CirkBVo8Q5W5fmhx4
 hxT8rmskGAC4PUoTC7NZzfFFo58RstClnetQv29QJO4e6tSib+nBolqWhsYq8lIk
 6sebUBmnNIM0HUZILE2px1WsHI2mWhGmImJawdUFNE+A0phqwDKh8xwUXNh9in2M
 eTrcnx63/r7P8ihy5fToKZzS6Z9oEymfcM4J3ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Bh7AjQ
 quAwy7lA11o8AfyIIMeICi9Eq6sKvm7YtZ9To=; b=ToPW/csHjBIM/KljL0uBI/
 4oElVyB/y/h5kqiSR8UeMDCYM42sSTdiHRiyWT7OPEvfIrrWPu4kcfbKnsMRDtL1
 9C4RK/o4Em2/bA9dSz9DA54wF9ZiMVs5tPMA4lXzT6b++qdGrc1X2ZgHjU3xHh9q
 YkRxrgFaPbakdxvmgEY1I6Gesq23cDJsebqNn3biOBoOpuWvVyD24x9EdLJkSiI/
 nP9FGxE6P8wDg5ELRf8EpoYwgfcU90cFnGP1GfUaRIRvtI6f9LFxiJvqzgcNHs01
 DpUjMZ7CfAoPXwMcoE6yeZFzRMdUVe46hNWaJoEzBnONLDB1dyUupJIaYGgjWHNw
 ==
X-ME-Sender: <xms:kKNiX49lhbemoiNGr-yegHhqGEPOK2xT4TKkQCKZ-G1Xm8FZgDJx_A>
 <xme:kKNiXwvU1Obbb6Vr4JUmggSPbbn2zTVH06famxqskDkL53vHIhKoLgBDiaZP9xvcW
 z2uEMpx-_B1vwOeEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:kKNiX-CCpHq8TY4Qp3535LlIriy2f7DXZA8oH-RthPUSQITVr0FlEw>
 <xmx:kKNiX4dlBDGXKiEAfVy-Yb8gqxhpvq4gABhbdN0c6fQQIn9J2hCmPA>
 <xmx:kKNiX9NIzrjgKw5mDwdC_SX4WFsuiW6HuXoeWwJdqtrXmZ5FxWg9nA>
 <xmx:kqNiX736ea0bVfRoMYEsPe4TmUBI_uUGGG2iDbCX8iKNtXt87QXuZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3D8B8E00D1; Wed, 16 Sep 2020 19:45:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <644a9acb-e1a6-4077-ac15-15dad58144dc@www.fastmail.com>
In-Reply-To: <20200916084703.778386-2-joel@jms.id.au>
References: <20200916084703.778386-1-joel@jms.id.au>
 <20200916084703.778386-2-joel@jms.id.au>
Date: Thu, 17 Sep 2020 09:15:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: aspeed: Add silicon id node to SCU
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 16 Sep 2020, at 18:17, Joel Stanley wrote:
> Different Aspeed families have various unique hardware silicon
> identifiers within the SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/mfd/aspeed-scu.txt    | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt 
> b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> index 4d92c0bb6687..fff3151f06ee 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> @@ -20,3 +20,26 @@ syscon: syscon@1e6e2000 {
>  	#clock-cells = <1>;
>  	#reset-cells = <1>;
>  };
> +
> +Silicon ID
> +-----------------
> +
> +Families have unique hardware silicon identifiers within the SoC.
> +
> +Required properties:
> +
> + - compatible:		"aspeed,silicon-id" or:
> +			"aspeed,ast2400-silicon-id" or
> +			"aspeed,ast2501-silicon-id" or

aspeed,ast2510-silicon-id

> +			"aspeed,ast2600-silicon-id"
> +
> + - reg:			offset and length of the silicon id information
> +			optionally, a second offset and length describes the unique chip id

What about chips with multiple silicon ID regs? I guess we just pick a sensible 
one, though given recent events maybe we should make an explicit note for the 
2600?

Andrew
