Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A34E6A97
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 23:19:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPflz5w4sz307B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 09:19:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=djg9eGvY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=djg9eGvY; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPflx33zpz2x9F
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 09:19:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=uIfPofyuq9jXCiykRc3r/F358w9m2+gmmcJgChLDMcM=; b=djg9eGvYk/K0/p61r7PkgDJa72
 /o8Sai6SCbybHaem/4AvvP097eTdf15TxS8ktc63Nf1nSLvMbWbEfKgr0iWjP7hPtlyleOasmDUFO
 Trr2gi9oZ9WMov8BV0YEwrxyoOdM4DD4SynTuqOtLr/PErt+Ti2ttqTPeMkbd6beulcw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nXVnj-00CVzH-84; Thu, 24 Mar 2022 23:19:27 +0100
Date: Thu, 24 Mar 2022 23:19:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: [PATCH] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Message-ID: <Yjzub26okJosPkXC@lunn.ch>
References: <20220324164551.359570-1-quic_jaehyoo@quicinc.com>
 <YjzhT4gOJ9SKy6q+@lunn.ch>
 <88849423-c4a5-0a68-1900-72196395704e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88849423-c4a5-0a68-1900-72196395704e@quicinc.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Jamie Iles <quic_jiles@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 24, 2022 at 02:27:34PM -0700, Jae Hyun Yoo wrote:
> Hi Andrew,
> 
> On 3/24/2022 2:23 PM, Andrew Lunn wrote:
> > On Thu, Mar 24, 2022 at 09:45:51AM -0700, Jae Hyun Yoo wrote:
> > > From: Graeme Gregory <quic_ggregory@quicinc.com>
> > > 
> > > +&mac2 {
> > > +	status = "okay";
> > > +
> > > +	phy-mode = "rgmii";
> > 
> > Are you sure about this? That PHY are you using? It is more normal to
> > use rgmii-id.
> 
> Yes, I'm sure. PHY works with rgmii on my board. I picked a different
> clock delay setting too.

Do you know who is inserting the delay? It looks like rgmii will be
passed to the PHY. So there are few possibilities here:

The MAC is adding the delay. Not recommended, but does work. In that
case, your DT is correct.

The bootloader or strapping configures the PHY to insert the
delay. The PHY driver then ignores 'rgmii' and leaves the
configuration alone. This will break sometime in the future when
somebody fixes the PHY driver to actually set the PHY to rgmii as
requested. In this case, both the PHY driver and your DT is broken.

The board itself inserts the delays by having long tracks. In this
case, your DT is correct.

It would be good to understand this, just in case it is the second
condition.

      Andrew


