Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C681A5D6
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Dec 2023 18:00:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwKZ25PqWz3cTT
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Dec 2023 04:00:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 31574 seconds by postgrey-1.37 at boromir; Thu, 21 Dec 2023 04:00:22 AEDT
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwKYy0RLLz2xSl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Dec 2023 04:00:18 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 4187730014241;
	Wed, 20 Dec 2023 18:00:12 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 321F6324F8; Wed, 20 Dec 2023 18:00:12 +0100 (CET)
Date: Wed, 20 Dec 2023 18:00:12 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v8] ARM: dts: aspeed: Adding Facebook Bletchley BMC
Message-ID: <20231220170012.GA10387@wunner.de>
References: <20231220080733.GA30641@wunner.de>
 <F444BFCC-1D44-4AF6-A0E1-B153A217FFE3@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F444BFCC-1D44-4AF6-A0E1-B153A217FFE3@stwcx.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Howard Chiu <howard10703049@gmail.com>, potin.lai@quantatw.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Howard Chiu <howard.chiu@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 20, 2023 at 06:38:59AM -0600, Patrick Williams wrote:
> On Dec 20, 2023, at 2:07AM, Lukas Wunner <lukas@wunner.de> wrote:
> > On Tue, Dec 07, 2021 at 05:49:24PM +0800, Howard Chiu wrote:
> > > Initial introduction of Facebook Bletchley equipped with
> > > Aspeed 2600 BMC SoC.
> > [...]
> > > +        tpmdev@0 {
> > > +            compatible = "tcg,tpm_tis-spi";
> > 
> > What's the chip used on this board?  Going forward, the DT schema for TPMs
> > requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".
> 
> Why is this a requirement?  This assumes there is exactly one chip.
> TPMs are often placed on a pluggable module in which multiple vendors
> could be used. There is no way in the DTS to specify multiple compatible
> chips.

It seems to be a convention to provide the name of the chip that's
actually used, in addition to the generic compatible.

One advantage I see is that specific properties can be enforced per-chip.
E.g. Infineon SLB9670 TPMs support an SPI clock of up to 43 MHz,
whereas Atmel ATTPM20P support 36 MHz.  The devicetree schema may
contain those maximum speeds and the validator can check whether
devicetrees observe them.

Similarly, a device driver may use chip-specific quirks based on the
compatible string.

Last not least, it is useful for documentation purposes to specify which
chip is used.

If chips are dual-sourced or triple-sourced, as you say, and they
behave identically, then I think it is fine to specify all of their
compatible strings plus the generic compatible.  If they do not
behave identically, separate devicetrees should be used for each
board version with a different chip.

As for specifying the generic compatible last, this follows from
section 2.3.1 of the devicetree specification:

   "The compatible property value consists of one or more strings
    that define the specific programming model for the device.
    This list of strings should be used by a client program for
    device driver selection. The property value consists of a
    concatenated list of null terminated strings, from most specific
    to most general."

    https://buildmedia.readthedocs.org/media/pdf/devicetree-specification/latest/devicetree-specification.pdf

Thanks,

Lukas
