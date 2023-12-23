Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B781D330
	for <lists+linux-aspeed@lfdr.de>; Sat, 23 Dec 2023 09:36:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxyFW62Vtz3cSv
	for <lists+linux-aspeed@lfdr.de>; Sat, 23 Dec 2023 19:36:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxyFR3d67z30YR
	for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Dec 2023 19:36:43 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 19E69100D9414;
	Sat, 23 Dec 2023 09:36:24 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id DBDE35119; Sat, 23 Dec 2023 09:36:23 +0100 (CET)
Date: Sat, 23 Dec 2023 09:36:23 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v8] ARM: dts: aspeed: Adding Facebook Bletchley BMC
Message-ID: <20231223083623.GA17734@wunner.de>
References: <20231220080733.GA30641@wunner.de>
 <F444BFCC-1D44-4AF6-A0E1-B153A217FFE3@stwcx.xyz>
 <20231220170012.GA10387@wunner.de>
 <ZYYP1C0h4ms9kEjA@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYYP1C0h4ms9kEjA@heinlein.vulture-banana.ts.net>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Howard Chiu <howard10703049@gmail.com>, potin.lai@quantatw.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Howard Chiu <howard.chiu@quantatw.com>, linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Dec 22, 2023 at 04:38:12PM -0600, Patrick Williams wrote:
> On Wed, Dec 20, 2023 at 06:00:12PM +0100, Lukas Wunner wrote:
> > If chips are dual-sourced or triple-sourced, as you say, and they
> > behave identically, then I think it is fine to specify all of their
> > compatible strings plus the generic compatible.  
> 
> This has explicitly been rejected before; having multiple incompatible
> chips listed in the same compatible.  I've tried to search lore but I
> can't find a reference unfortunately.

I'll let devicetree maintainers comment on that.


> Furthermore, what you're suggesting does not jive with what is in the
> devicetree binding documentation for tpm_tis-spi [2]:
> 
> - compatible: should be **one** of the following (emphasis mine)

That's superseded by:

https://lore.kernel.org/all/cover.1702806810.git.lukas@wunner.de/

I don't really have a dog in this fight, I merely stepped up to
convert TPM DT bindings to YAML.  There have been multiple attempts
to convert them in the past but none of them have been pursued into
mainline.

I looked at compatible string usage in arch/arm{,64}/boot/dts
and was under the impression that the majority of devicetrees
use a combo matching this pattern:
"vendor,chip", "tcg,tpm[_-]tis-{spi,i2c,mmio}"

So that's what I went for in the conversion.  It would be inconsistent
to enforce a generic compatible for i2c and mmio, but not for spi.

I ran the validator against all arm/arm64 devicetrees and there are
four devicetrees which only use a generic compatible and not a
"vendor,chip" compatible:
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi

So, three Aspeed Facebook and one Moxa.  There's a fifth case (phyTEC)
but the devicetree author clarified it's an Infineon SLB9670.
The authors of the other four devicetrees listed above did not respond.

Patches to fix up schema violations are here:
https://github.com/l1k/linux/commit/7813a455ed15393df7d9d353173635b98ae23387
https://github.com/l1k/linux/commit/a958be44952b1de170100be1007780a72ce7d861


> As I said,
> these are pluggable modules and not simply second-source builds.  There
> are a collection of modules that can all be plugged into the same header.
> They might not even be shipped with the device...

If those TPM modules might not even be plugged in or are interchangeable,
I think they ought to be represented as DT overlays.

Honestly I'm wondering how common the scenario you're describing is.
If it's an edge case, it might not be worth holding up the YAML
conversion because of it.  The missing YAML conversion is a constant
cause of pain for a lot of people.

Thanks,

Lukas
