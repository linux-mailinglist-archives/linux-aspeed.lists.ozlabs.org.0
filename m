Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F598160760
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Feb 2020 00:53:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LP7w6WR6zDqb0
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Feb 2020 10:53:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=yPRKnQly; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FowAQ+qh; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LP7q3wSjzDqRq
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Feb 2020 10:53:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DA57B45B;
 Sun, 16 Feb 2020 18:53:08 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 16 Feb 2020 18:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=kng93RDpRhIGVp/TfI47lao7THXnLfW
 W0NsfRxKSYlw=; b=yPRKnQlygwn4qFGjCVphZPASOpjQb704HJAkNtlyVMkOPZb
 dX4Sy3v9BnW4DidH+o2rkboyZu/WpIUk61X71ESjkS6ePg54+qo2MCQNmqrc3hK/
 ZLw/laZJrlMmoCihwMReAeoPoMVOef3KbdxVLgGf5bVsV8A44RX2u/9iipE8d4DT
 d1BdzIfFXsMUcXvGHhPnmMcm13ocszp5/8NOrp8xtI6jnqSI1Sxi8dDnLMw9O3B+
 O7UYc6h916kqbP31Fv1SRxcdJcMAJbVpm+eVClQjkLEg3bne45Eb4Iyl3CV1HwVV
 pwPZer8TjQknIAfh8t9whEINQyMAmNwc9cHH5jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kng93R
 DpRhIGVp/TfI47lao7THXnLfWW0NsfRxKSYlw=; b=FowAQ+qhQkuOvb2JBhVhUI
 8YqdS6YnX71QiRcz4U+R51fnQRwBKDYifVJhCTVzwF6BM/phSj/gdjJC6O2ffeiX
 rakNWgxTAM8n58ukbRgvS/5GsqeZaXZHCT+q/dD/yk1c0NFSc6xPQvyobiS6CXWX
 xeg2aJ6rrmOInU8pdcBbwKHpOGZvrTAwkmMxih6Ke7YNwg/QFD2ukfACCrU5+1F7
 LJObqEIAcQOAOK0pfEdL1GHKrucJR8dGJ8MDDqLmPSK+eAFVQduKrIZDIcx8vM2e
 E2N3Gw4kYzpHkCkI7A01DupvnY4F72M7FGsAOj/FdTzB89z7NDFzWUuwp8ZrexsQ
 ==
X-ME-Sender: <xms:4NVJXjGQVILpi8K4RCfxv39DJSXZRESyb_o5jd6YXsXqX6GQ2yTBmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:4NVJXrwc66zUSkMm6ZwsqymduR4oAB2E88GcaJ21OcQj6lfQ6DHeUA>
 <xmx:4NVJXou51DGcKLvgEsxjMndiRGvXnIO2kEEH60PSX8fS3wLwFY7DFA>
 <xmx:4NVJXqEBcb9br3spCn9ZBIeZWwTZYXfy8ImrVEOaUM2yvphelwjrBA>
 <xmx:5NVJXtca4_qVUbvn-LJPJ0NhywNZfh6Grk5eGw-AKXXKJ1wsZ8caaA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 78990E00A3; Sun, 16 Feb 2020 18:53:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <b4582178-9b9d-494e-a458-d5576b4e0266@www.fastmail.com>
In-Reply-To: <1581363147-19310-2-git-send-email-eajames@linux.ibm.com>
References: <1581363147-19310-1-git-send-email-eajames@linux.ibm.com>
 <1581363147-19310-2-git-send-email-eajames@linux.ibm.com>
Date: Mon, 17 Feb 2020 10:22:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_1/2]_ARM:_dts:_aspeed:_ast2500:_Fix_SCU_IRQ_cont?=
 =?UTF-8?Q?roller_node?=
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
Cc: linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 11 Feb 2020, at 06:02, Eddie James wrote:
> The node was defined with a unit address but had no reg property,
> resulting in a warning. Add a reg property for consistency to fix the
> warning.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 569f9d7..9db7bde 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -225,6 +225,7 @@
>  				scu_ic: interrupt-controller@18 {
>  					#interrupt-cells = <1>;
>  					compatible = "aspeed,ast2500-scu-ic";
> +					reg = <0x18 0x4>;
>  					interrupts = <21>;
>  					interrupt-controller;
>  				};
> -- 
> 1.8.3.1
> 
>
