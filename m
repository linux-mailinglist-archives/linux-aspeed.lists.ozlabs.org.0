Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DB11115
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 04:05:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vdrc2YzXzDqNd
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 12:05:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ND3M0h0R"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BJGNLqBy"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vdrT6FBkzDqCx
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 12:05:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2221323281;
 Wed,  1 May 2019 22:05:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 22:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=bZeERvGAnYQ52FPuYTSYIQK3NANXy16
 44x52Qktc3kM=; b=ND3M0h0R+VkvPg58n22g3wxdDeewZCSuNbI6DZTbdEcI4Xv
 3b3o+QfjTdrbJnc59hsGhqmbwvDa4s9EgChuXma2KvlJFR3fColr4FqlG1zL4SCX
 DXOhUu2zdTR1+as61fcd6Uy3F9fcYsaF4hF4wa34epDfhSAjA6aNr2x9s//JSxJK
 aRPW5AKGdh3QOR4bJW29lAvJ6Sjvz4iOtbye0uMB0+9jvrLlwEJzCuAtP32gVZ+j
 +uXSFAg+cV4eSHpEzs6tBUko+IHT8z/pNvUTWr/8zlqWCXzbaM8DjHPfxsUZaozx
 E/NWzNO0xSy6i+9ez3gJfMc2ci8KmalgwQOikOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bZeERv
 GAnYQ52FPuYTSYIQK3NANXy1644x52Qktc3kM=; b=BJGNLqBy6laTdBEmqhbdGz
 owRfwkAm6UNPLxzz2QYM4rAA0PzY9qC4Ib6podRVpd27O+bWYxVhXDXSTqOtjUqO
 wRkiPjNlPv5j9G9mQUda9kwJE5hfto57Rm+c0DwGxOFwb67zQrAT5CR/vL0cxt9h
 ieyOSVjlwVggs51BT3etTXAzzDg1tojCPdKfcdns7nisb/38TZFmCKKZQbbgHqGU
 EtMzOezrnIRQxiEcMOIunCdOsLafKcpfO8i9Jj/LWr3ZIXT3OrWFyxguKxIalprO
 I5hg6jks+Z3I2r6KIaH9HoH46KusNz2k3Kvf2QI1DqGPJJykSk/pPvQpsnUqd+GA
 ==
X-ME-Sender: <xms:VlDKXP0-7JDl3mUMasmFXzvjwDMWYsJj7q6q1rNcxO0tOd8hqKWbaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:VlDKXAjasqCW5MicFv07bjhzUGNp_A6566wKwmhlJDwv0gFQKf6-jg>
 <xmx:VlDKXAHLDisxzBc76a96bW4A7KlX62lilUkgFT7dpuZzKIZHCNt2YA>
 <xmx:VlDKXMUG0jFClqQAnbwqdvtvulMcGCPTjc_jsQ0BvmmIlBP7HmG2qQ>
 <xmx:V1DKXHj0o9b3s2MA2RZbkoZyuJYpWUwJI-nlFn0ECLP_X7gPI0ZkaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 298617C6D9; Wed,  1 May 2019 22:05:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
In-Reply-To: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
References: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
Date: Wed, 01 May 2019 22:05:09 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Timothy Pearson" <tpearson@raptorengineering.com>,
 linux-aspeed@lists.ozlabs.org, "Ryan Chen" <ryan_chen@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_2/3]_aspeed/pinctrl:_Fix_simultaneous_RS-232_/_PWM_?=
 =?UTF-8?Q?and_DVO_outputs_on_AST2500_devices?=
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 2 May 2019, at 08:20, Timothy Pearson wrote:
> There appears to be a small error in the pinmux table on pages 130 and
> 131 of the AST2500 datasheet v1.6.  Specifically, the COND2 requirement
> used to mux the surrounding pins to DVI was inadvertently replicated to
> pins V1, W1, V2, and W2 in the table, which do not incorporate DVI
> functionality.
> 
> As a result of this error, both serial TX lines and the PWM 0/1 outputs
> were overriding the VPO pinmux settings when VPO was enabled in the
> pinmux hogs.
> 
> This patch has been verified to function on Blackbird hardware.  Both
> serial TXD pins and PWM0/PWM1 were functionally tested with SCU94[1:0]
> set to 0x1.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 187abd7693cf..6f357a11e89a 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -696,14 +696,14 @@ FUNC_GROUP_DECL(NRTS1, P3);
>  #define V1 94
>  #define V1_DESC		SIG_DESC_SET(SCU84, 22)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHV1, DASHV1, VPIRSVD_DESC, V1_DESC);
> -SIG_EXPR_LIST_DECL_SINGLE(TXD1, TXD1, V1_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(TXD1, TXD1, V1_DESC);
>  MS_PIN_DECL(V1, GPIOL6, DASHV1, TXD1);
>  FUNC_GROUP_DECL(TXD1, V1);
>  
>  #define W1 95
>  #define W1_DESC		SIG_DESC_SET(SCU84, 23)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHW1, DASHW1, VPIRSVD_DESC, W1_DESC);
> -SIG_EXPR_LIST_DECL_SINGLE(RXD1, RXD1, W1_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(RXD1, RXD1, W1_DESC);
>  MS_PIN_DECL(W1, GPIOL7, DASHW1, RXD1);
>  FUNC_GROUP_DECL(RXD1, W1);
>  
> @@ -766,14 +766,14 @@ FUNC_GROUP_DECL(RXD2, T5);
>  #define V2 104
>  #define V2_DESC         SIG_DESC_SET(SCU88, 0)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHN0, DASHN0, VPIRSVD_DESC, V2_DESC);
> -SIG_EXPR_LIST_DECL_SINGLE(PWM0, PWM0, V2_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(PWM0, PWM0, V2_DESC);
>  MS_PIN_DECL(V2, GPION0, DASHN0, PWM0);
>  FUNC_GROUP_DECL(PWM0, V2);
>  
>  #define W2 105
>  #define W2_DESC         SIG_DESC_SET(SCU88, 1)
>  SIG_EXPR_LIST_DECL_SINGLE(DASHN1, DASHN1, VPIRSVD_DESC, W2_DESC);
> -SIG_EXPR_LIST_DECL_SINGLE(PWM1, PWM1, W2_DESC, COND2);
> +SIG_EXPR_LIST_DECL_SINGLE(PWM1, PWM1, W2_DESC);
>  MS_PIN_DECL(W2, GPION1, DASHN1, PWM1);
>  FUNC_GROUP_DECL(PWM1, W2);

This looks reasonable to me. I'd like Ryan to chime in though.

Ryan, can you confirm the datasheet needs correction here?

Tim: You need to send these to a broader audience than the linux-aspeed@
list. Please use ./scripts/get_maintainer.pl to determine the appropriate
people to send to. This at least needs to go to Linus Walleij, who maintains
pinctrl.

Andrew

>  
> -- 
> 2.11.0
> 
>
