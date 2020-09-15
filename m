Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A782269AB4
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Sep 2020 02:51:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br4Rd6S1czDqQl
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Sep 2020 10:51:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=egH0gfz6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SzCs7F4/; 
 dkim-atps=neutral
X-Greylist: delayed 398 seconds by postgrey-1.36 at bilbo;
 Tue, 15 Sep 2020 10:51:13 AEST
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Br4RP4DP0zDqQk
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Sep 2020 10:51:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E6D5C4B9;
 Mon, 14 Sep 2020 20:44:30 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 14 Sep 2020 20:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Q96ecm6Fh2HW7IzVYh/+DlYr1BnZskX
 RguVfWn9NZoY=; b=egH0gfz6DQqKjqINfH01fl+Fidfq6dOPqampmZTMi3293Ni
 LHsMOq7B3GW9PJ4sedks1m+AnB9+dVlcmH3uplFWO/isOonmMcc5obJV21eIUtuD
 o2KO+VvRl0CP1MxVMFq1xuiWXUrJv+RuGXHFjwOvl6qdlNDWSrswQRCoSOP+tOhd
 2CKWfpxeh6ojXqv1jw/4+qv3IHCz8LuUU/XIZGivjvH91GjPvsevXI47Uh1ZiPBE
 5TC+F/RcY80fZ2Qov77Dhjp+kqfvb2yohJMxbUZS7k7v4jcCfs7NQRP0F+9lC6Pp
 +3K1DLQpLknu4S4K60PX7VZwMjy1CQjLbkeTWzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q96ecm
 6Fh2HW7IzVYh/+DlYr1BnZskXRguVfWn9NZoY=; b=SzCs7F4/rKj8sk+V9Wiy04
 wzEtw50hcwBwTg2SW7ZlDbeUK91cuS3xF28dKNQKF2SV2ml+Fj2z0T6EzE1pNLjn
 B2Yf23BHv9zg2+lVG/aRC43JDgdYGvKYLCJ/Uz53AhvV+CzWLYOYlRN6T+ftegUu
 WN05FlbtEHFvu2mctp1brWCTuQAYLquX1k1IDJjFkDwdESgJmopd/MuLS81/+9XG
 jKBHLmqLIwrQm2wl3cdZmCyNmAPG48gDfEHkAfSouh91TbMqPJ1x8fNKaGjZt/5+
 Hls574iM88Bn3fLtwNa7Xfn9XNJw5waQlPzX9DUrq+glSqrsZrT4CfEuZVXDZHLA
 ==
X-ME-Sender: <xms:bQ5gX8EkLfdwFy6CfXTNiCbKtCbeBUdnOwGj404k1UkFR5yUl0ELSw>
 <xme:bQ5gX1UoIFWmUv0WqBTrOO12wDgqXg98S3ROzAayKPyM_xPsotzQJtqJjgpLDPSUG
 p1K9aLumxxqSZOv2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeijedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepteehteelkedukeekjeejgeelkeduieejgeejudeugeelvdekjeelffet
 fffgjeeunecuffhomhgrihhnpeihrghmlhdrrghsnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:bQ5gX2Liqf7V9DlGhIdl2N4bWR1uyyCD5WBTMoMLjABvW_hFWB3YFA>
 <xmx:bQ5gX-Hb9AL_90bdbUQtz0zwhixwyXxG-16a52V3SIm0nx5ETPrcyQ>
 <xmx:bQ5gXyWJfU2Qy7PhE8PgZkXQUHeClznlTAAXewWhbUHCUdGR5vEs-w>
 <xmx:bg5gX0I8oc-gCIetjU5IQH1XTcOvRg36hEUibMEnyz6iYbAamQx5eg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 041DAE00C7; Mon, 14 Sep 2020 20:44:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <e4bab65c-8a81-4a4b-be3f-3a07d5c7f95f@www.fastmail.com>
In-Reply-To: <CAPDyKFq+QYzJNT94eFt2EsQBVqQciUoqnMDdrr3DbbkpnHRpCw@mail.gmail.com>
References: <20200910105440.3087723-1-andrew@aj.id.au>
 <20200910105440.3087723-2-andrew@aj.id.au>
 <CAPDyKFq+QYzJNT94eFt2EsQBVqQciUoqnMDdrr3DbbkpnHRpCw@mail.gmail.com>
Date: Tue, 15 Sep 2020 10:13:58 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
Subject: =?UTF-8?Q?Re:_[PATCH_1/3]_dt:_bindings:_mmc:_Add_phase_control_propertie?=
 =?UTF-8?Q?s_for_the_Aspeed_SDHCI?=
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
Cc: DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 14 Sep 2020, at 19:11, Ulf Hansson wrote:
> On Thu, 10 Sep 2020 at 12:54, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Add properties to control the phase delay for input and output data
> > sampling.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > index 987b287f3bff..75effd411554 100644
> > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > @@ -61,6 +61,14 @@ patternProperties:
> >        sdhci,auto-cmd12:
> >          type: boolean
> >          description: Specifies that controller should use auto CMD12
> > +      "aspeed,input-phase":
> > +        $ref: '/schemas/types.yaml#/definitions/uint32'
> > +        description:
> > +          The input clock phase delay value.
> > +      "aspeed,output-phase":
> > +        $ref: '/schemas/types.yaml#/definitions/uint32'
> > +        description:
> > +          The output clock phase delay value.
> 
> We already have a common mmc clk-phase* binding, see
> mmc-controller.yaml. As matter of fact, there is one binding per speed
> mode.
> 
> Could that work for this case as well?

Ah, great, I think so. Sorry for overlooking that. I just need to extract from 
Aspeed what units the damn register fields are using :/

Andrew
