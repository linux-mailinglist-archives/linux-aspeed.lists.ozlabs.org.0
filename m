Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ADE1C3B2B
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 May 2020 15:24:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G3VN1Mf1zDqXV
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 May 2020 23:24:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=KwE4E4Nh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oEEqvNl7; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G3V23CsHzDqV1
 for <linux-aspeed@lists.ozlabs.org>; Mon,  4 May 2020 23:24:09 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B5B375C00EF;
 Mon,  4 May 2020 09:24:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 04 May 2020 09:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=DJbaaOuR+6YHYaJHgAZbaqepInhtEO+
 O3opNfcdNHMk=; b=KwE4E4NhpTz3bFlHAfJsiyBVoDjPGT6iphiVk2YB+0MFae/
 bAHjfF9EpBYQou+5B6CoQKJU7i6dfZXQQqb33O6toyISkuQh6lKCBLNa6fEEoyb2
 x1XHQwVA6nn5Qu+u5BYbivJ2IBbZRMn5mRuBRFXMspWPkWJTzhOgjIcXvnYK4YLT
 YwKAcN514atSqpqir0N07vj+4NpaudOkIChi6cQfiv6xJnoOvEcUyTz+CzC8Vcxf
 bymRkPa2Vzjoq8Lv87W8lBPJUolowqd8G+y0AJLqtqh1/mRjS33om2nli4cTEt24
 YN4OuvhpVcUwjF5w6EHzfIMWchCxynRkoeuRclQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DJbaaO
 uR+6YHYaJHgAZbaqepInhtEO+O3opNfcdNHMk=; b=oEEqvNl7bv9sucTj20Y/R/
 PaNZ9cTflvHMhRC5eFH7Okx/LTmLkDRmLDbVvfBEZrcuix6kO7zjsMzOo5Af7u8o
 PEieVA0QT/uT/0M2eC6CG2wApyoZIFdphGo3/wYsFxg+Awxfj5SrCJIcXDT0Ja8j
 K/rP1RSYN5uZQtdxorw3t6SqFCBZC0dnbGCKHckkszG4ukXK4dihYxZ2rk1HIe8c
 mXXhWqQDZq8jAuFJGBEAm9XFgGjJz668ImK/jUL3WnZubKFfchkE+wfdvpm/ijXT
 mJTXXo6UJ4wcmPY8RVf1krfjnAeJ0KoWIFT3KzvcJjUC5KF4kNiayq+BkJMQG2MQ
 ==
X-ME-Sender: <xms:ahewXruF53BQnNhnb2cWtIa8oqZvGEkI5R66wbqsp9C3WOXP_1izYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ahewXoLCwJMrgaFGB-q6aGgla5a-oVChd3b2MalmrAMdUmmutEHN9Q>
 <xmx:ahewXpf2878l6Q3sK8698xAr2nhmL4zmoH0EKFHkY8XM3kYzS9do2g>
 <xmx:ahewXrLvyf0C32mc8Vaw6JEueOa1RGQqOC1bwfwbQOZJZjyWCG5sxg>
 <xmx:dBewXm0j82CQmSxvcOLkLoxITE2jVaVa7PY6vbAOqaFGWi3EMJ9SIA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 72E8FE010B; Mon,  4 May 2020 09:23:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <0ca41514-d664-41e6-9f0c-0d948db3e9ad@www.fastmail.com>
In-Reply-To: <CACPK8XezSFzCeQN4tkvcmjOHEAgrRGYBiBzRymaazpv8Lh-gTQ@mail.gmail.com>
References: <20200424135303.20952-1-a.filippov@yadro.com>
 <CACPK8XcP3V=8fAUfNvRFqPU9G38dGR43Kpp=Uxm=P_AjrMnzBQ@mail.gmail.com>
 <c1de0c90-d486-4855-bb26-0f3cc416b05d@www.fastmail.com>
 <CACPK8XezSFzCeQN4tkvcmjOHEAgrRGYBiBzRymaazpv8Lh-gTQ@mail.gmail.com>
Date: Mon, 04 May 2020 22:53:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v5] ARM: DTS: Aspeed: Add YADRO Nicole BMC
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 4 May 2020, at 22:14, Joel Stanley wrote:
> On Mon, 4 May 2020 at 11:04, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Mon, 27 Apr 2020, at 20:41, Joel Stanley wrote:
> > > On Fri, 24 Apr 2020 at 13:53, Alexander Filippov <a.filippov@yadro.com> wrote:
> > > >
> > > > Nicole is an OpenPower machine with an Aspeed 2500 BMC SoC manufactured
> > > > by YADRO.
> > > >
> > > > Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> > >
> > > This looks good to me.
> > >
> > > Andrew, do you have any comments before I merge?
> >
> > Not other than muxing all the ADC lines to enable just one seems a bit strange,
> > but Alexander mentioned previously that the rest were simply grounded so it's
> > not going to cause any problems in practice.
> 
> Thanks. Can you say the magic words for patchwork to pick up?
>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
