Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16680FD8
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 02:48:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461zdl45ySzDqXb
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 10:48:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KouHbajv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kPaNfa3g"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461zdc1HRdzDqWy
 for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Aug 2019 10:48:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7C2CD16BF;
 Sun,  4 Aug 2019 20:48:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 04 Aug 2019 20:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=wVRpJrgZ1O2Fju5cbM4E047p8yDD7x/
 0FjNTZOxLy8A=; b=KouHbajvM5FTe5slhbI3hC2lczfuS90T9Jxq/k4GpPAXW3h
 HugHeepMQ+QxDJcrrchOQ1VAqXNNFEOsWL97R/IcAe4l+mbizw9iqtkDcoAFnh0X
 seovXUIddjx47kFX6hFXBChUSzl4ze9W+zwYf6TXXgerzeJGgvU1DZhbS849ImRW
 /e4b32jzTzIeNFRyg6IzoX8cazIY83I8yohFl+dB+vqZ3ArhdSa5iEsqHpAyPUDf
 QqCV6O7/ilnpb4umTPeM8OPTAA7jHW6hBNJCHSuHGVm68tQ3fCdd7MkD3RP8xwVv
 fQvZtmh0KefZECyo4KqXbwox/tR9OghhnevkT/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wVRpJr
 gZ1O2Fju5cbM4E047p8yDD7x/0FjNTZOxLy8A=; b=kPaNfa3gItyPsgkEtYnPEx
 ZWMrlMf/0VEwKYOqlfEYuUQCJfH15DbnP92xDipWrPXCTKuXtJUhZp9pna73Lk4n
 bumeSKK+UCKZ9b0/Khnl2Qpch+VccyqQ61D3cUhfdjV8y5u625CIpWEP7oeHCLqZ
 HF/IE6IziAaee7ajhvZhxl5XNtTU2jrZuOzVu2ouldc/ttf7GAWnlNBNi15USOXD
 JjCl8mBXmXTvNVvT1u0esC1owINwkmXB1xS/Oxwri9zAP8JINhKpaK+FgPiMqV/x
 oYQtlnWxpakK5v0cPxb9Wyz5YmiLkU80urNmC8m/suDVSBJk5puhuMmf8oJqYQMA
 ==
X-ME-Sender: <xms:vHxHXae8zQkQoIXOFmhTlYGbWfRNpWOI-HINgXhGX2UygIWYbvuKZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtiedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:vHxHXYdSMGHxjZ4pnB-Ih6FhwhszzhpideX8pQECYN7z2CciX5vnSg>
 <xmx:vHxHXWha17NCHarMxWIGvYsAQpQN_0u3dGGl-KAV-JwWc_BWf-pVHw>
 <xmx:vHxHXcT3yaRYfFFGevfhXKYxLtpI1CCuze7nBKJU72nktFY9vzBOIg>
 <xmx:wHxHXTjzDEJZKPlzisyKmdB0D309JcA8BJ-nH7F9fhiZii5hKAPq2A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BC0C0E00A2; Sun,  4 Aug 2019 20:47:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <5a6a22f8-d459-4aec-b69b-e49d096afa85@www.fastmail.com>
In-Reply-To: <CACPK8Xc4Vigeu1B1Su5392BSCSKfoEDqt_tiDtgKmNH5ucAvAg@mail.gmail.com>
References: <20190726053959.2003-1-andrew@aj.id.au>
 <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
 <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
 <CACPK8Xc4Vigeu1B1Su5392BSCSKfoEDqt_tiDtgKmNH5ucAvAg@mail.gmail.com>
Date: Mon, 05 Aug 2019 10:18:21 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, Xo Wang <xow@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Ken Chen <chen.kenyy@inventec.com>,
 Adriana Kobylak <anoo@us.ibm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?YangBrianC=2EW_=E6=A5=8A=E5=98=89=E5=81=89_TAO?=
 <yang.brianc.w@inventec.com>, openipmi-developer@lists.sourceforge.net,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yao.yuan@linaro.org, Patrick Venture <venture@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan M Schaeckeler <sschaeck@cisco.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 2 Aug 2019, at 15:21, Joel Stanley wrote:
> On Tue, 30 Jul 2019 at 01:09, Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > > > The bang-for-buck is in fixing up the KCS bindings which removes all-but-two of
> > > > the remaining warnings (which we can't feasibly remove), but doing so forces
> > > > code changes (which I'd avoided up until this point).
> > > >
> > > > Reflecting broadly on the fixes, I think I've made a mistake way back by using
> > > > syscon/simple-mfds to expose the innards of the SCU and LPC controllers in the
> > > > devicetree. This series cleans up what's currently there, but I have half a
> > > > mind to rev the SCU and LPC bindings to not use simple-mfd and instead have a
> > > > driver implementation that uses `platform_device_register_full()` or similar to
> > > > deal with the mess.
> > > >
> > > > Rob - I'm looking for your thoughts here and on the series, I've never felt
> > > > entirely comfortable with what I cooked up. Your advice would be appreciated.
> > >
> > > The series generally looks fine to me from a quick scan. As far as
> > > dropping 'simple-mfd', having less fine grained description in DT is
> > > generally my preference. It comes down to whether what you have
> > > defined is maintainable. As most of it is just additions, I think what
> > > you have is fine. Maybe keep all this in mind for the next chip
> > > depending how the SCU and LPC change.
> >
> > Okay, I think the timing of that suggestion is good given where things are with
> > the AST2600. I'll keep that in mind.
> >
> > Consensus so far seems to be that the series is fine. I'll split it up and send out
> > the sub-series to the relevant lists with the acks accumulated here.
> 
> The series look good. I suggest posting the KCS bindings and driver
> changes as their own series to go through the IPMI tree.

Yeah, that was the plan.

> 
> Please add my tag to all the patches except the OCC one, which I need
> to do some investigation in to.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks, will do.

> 
> The others can go via the aspeed tree. Perhaps post them as their own
> series too so I don't get confused and apply the wrong ones. That way
> if Rob wants to send his reviewed-by he can.

SGTM.

Cheers,

Andrew
