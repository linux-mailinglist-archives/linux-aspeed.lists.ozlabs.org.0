Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 820596B52F
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jul 2019 05:51:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pNcT55gvzDqVr
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jul 2019 13:51:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ittckpy2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MNHcRQMs"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pNcN3VQWzDqML
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jul 2019 13:51:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7B1463D4;
 Tue, 16 Jul 2019 23:51:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 16 Jul 2019 23:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=4thMvaSx0dpdp8DeVpL+Ehe2s0YHQve
 mqdikPWzNKA8=; b=Ittckpy2uxPxMjk3vbo4z3p6QAjtzQ56b7VaChGXt5GhQR7
 raffad0sc3NM7F+FzXEML/2ezsfrxis739rcK0x2BVVHJz7WcifPsvQarI41gr82
 xzqJiwKTHOS4ecaBV3Y6awKMy5r8V4hP2kyqPPj0M1oTrRL7wmc8/AbvVB/v+0Tu
 ze3AwaSZDtxXazDMuIPxzIlNk30f5u9I0hwxcjtMu14aNb2em+qBNatHfkVmp87i
 gG/m4Bm+UFVSmZhckwoCTJwxyML6z9MwP5C4w/FFXis9DgzdQbG4RCHOg6U09Atl
 4aNny7PHO333Nx9xn6JBgoGLA4TBjC/RvM9AnMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4thMva
 Sx0dpdp8DeVpL+Ehe2s0YHQvemqdikPWzNKA8=; b=MNHcRQMsbJd56eano2zAeE
 7HjQLYOzNzGZrnT0sRqoLYDN2Y06t3xZm1D6SNg8mrZzlsVeCUxsobqI52A9nOkb
 ppvid8kfSF5a3QBzPb4eqbt4mrt3/YmZS4iObo9feApW5lLwBWnoN0U1UcdPjWVp
 hSQwH1HGU5/r40Hsu08s5DZhl7tiEGOMipf5srb4vGLbhqL2QutbtmWxJ6JLUE9Z
 U0lrygUA4ScATFBq0R/owdLQY8TuZwb8pMrEmP7lOVaH/MBKn6TBv+op1qRCPdg5
 OJjOHIK0dsI+zRfvA6UKjhYxmOa3fMwSUjL6W7+l0Thra3cxg2hpwtQit/yFs2kQ
 ==
X-ME-Sender: <xms:UJsuXa9AKq8eTdfjqInMIzFJmHl-qjr2eYXJEVOmibOw4dZtk7CNGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddriedugdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:UJsuXczKHxs6tx-PDyyyxJADh6EYzkly6D-elgEZFQTDhP77mq4bnw>
 <xmx:UJsuXaHoN2wACqzUMoyEqMAV3Hub67ooom2BhoP1o6re9Hs-1BRu2w>
 <xmx:UJsuXdKd42ax_K_IlmkLJzMX9iP6VYraDloBauLf2RayGj3T2HEaZQ>
 <xmx:UZsuXaCap9UL7j-gXkYzNknX1GMJglrxqMYx8QG5SfuUTg1Z4nXCWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 80240E00CC; Tue, 16 Jul 2019 23:51:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <7b027585-27ab-4070-bf2e-5d08800e1a90@www.fastmail.com>
In-Reply-To: <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
References: <20190715223725.12924-1-robh@kernel.org>
 <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
 <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
Date: Wed, 17 Jul 2019 13:21:54 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh@kernel.org>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH]_dt-bindings:_pinctrl:_aspeed:_Fix_'compatible'_sch?=
 =?UTF-8?Q?ema_errors?=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 17 Jul 2019, at 00:35, Rob Herring wrote:
> On Mon, Jul 15, 2019 at 5:17 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Mon, 15 Jul 2019 at 22:37, Rob Herring <robh@kernel.org> wrote:
> > >
> > > The Aspeed pinctl schema have errors in the 'compatible' schema:
> > >
> > > Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> > > properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
> > > Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> > > properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements
> > >
> > > Flow style sequences have to be quoted if the vales contain ','. Fix
> > > this by using the more common one line per entry formatting.
> >
> > >
> > >  properties:
> > >    compatible:
> > > -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> > > +    enum:
> > > +      - aspeed,ast2400-pinctrl
> > > +      - aspeed,g4-pinctrl
> >
> > Thanks for the fix. However, we've standardised on the first form for
> > all of our device trees, so we can drop the second compatible string
> > from the bindings.
> 
> Doing that would introduce validation warnings until the dts file is
> updated. So we still need this change until that happens.

My series takes care of that.

Andrew
