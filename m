Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71684389F
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 09:18:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QAdIJ/i+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPw0T3XyKz3c75
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jan 2024 19:18:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QAdIJ/i+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPw0M26ypz30fD
	for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jan 2024 19:18:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EBC9FCE1E2F;
	Wed, 31 Jan 2024 08:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A034BC433C7;
	Wed, 31 Jan 2024 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706689103;
	bh=uVuCtAAr/8kTNdmmZBQPRy6Y0jWrvVDn0rG6YH7p4VU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QAdIJ/i+5sP3lPohRphDzZU5Ek32FUCfbjWw+IU+SqwC23Yw1a4Q8cMIeUVIWL0dG
	 1A6e7MJzMb4OzeCay5vgD0QqzXGZZdsP0czcyN+6EH0I/sOnpdxWYEGI2OGhTR7E8f
	 a4YSgXQ3nT46s0HqO37puWNOwtSaGGs+Pqss3NBTmhDdFVPYOLeG5nPoWTwyN9VOrF
	 8EQbdiumMZislx9pWo6CJEJqBFBc15CMCxM60brdEsM0zRDnqraNjK3D989qfM+kKK
	 GEmt0l2qyFSVnhKuejfq9iKx/nddoUAFPuqoEjdZoHgoCuFaablECkFofWzJyYDBil
	 T6lPsOpD4cTBQ==
Message-ID: <88a036a2-2848-41d3-a0fb-48ee14604850@kernel.org>
Date: Wed, 31 Jan 2024 09:18:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30 2/7] Add binding for Aspeed SOC
To: "Corona, Ernesto" <ernesto.corona@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <LV8PR11MB8463D0017B82135324127DB98B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <LV8PR11MB8463D0017B82135324127DB98B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "'mark.rutland@arm.com'" <mark.rutland@arm.com>, "'robh@kernel.org'" <robh@kernel.org>, "'alexandre.belloni@bootlin.com'" <alexandre.belloni@bootlin.com>, "'rgrs@protonmail.com'" <rgrs@protonmail.com>, "'tytso@mit.edu'" <tytso@mit.edu>, "'arnd@arndb.de'" <arnd@arndb.de>, "'corbet@lwn.net'" <corbet@lwn.net>, "Filary, Steven A" <steven.a.filary@intel.com>, "'ebiggers@google.com'" <ebiggers@google.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "Castro, Omar Eduardo" <omar.eduardo.castro@intel.com>, "Chen, Luke" <luke_chen@aspeedtech.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'oleksandrs@mellanox.com'" <oleksandrs@mellanox.com>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 31/01/2024 00:30, Corona, Ernesto wrote:
> Aspeed AST2400, AST2500 and AST2600 JTAG controller driver.
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
> Signed-off-by: Omar Castro <omar.eduardo.castro@linux.intel.com>
> Acked-by: Rob Herring <robh@kernel.org>

1. There are so many wrong things with this submission that you should
drop the tag.

Please provide lore link where you received this tag. Quick look at lore
suggests you faked it.

2. Please use subject prefixes matching the subsystem. You can get them
for example with `git log --oneline -- DIRECTORY_OR_FILE` on the
directory your patch is touching.

3. Please use scripts/get_maintainers.pl to get a list of necessary
people and lists to CC. It might happen, that command when run on an
older kernel, gives you outdated entries. Therefore please be sure you
base your patches on recent Linux kernel.

Tools like b4 or scripts_getmaintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, use mainline), work on fork of kernel (don't, use
mainline) or you ignore some maintainers (really don't). Just use b4 and
everything should be fine, although remember about `b4 prep
--auto-to-cc` if you added new patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time, thus I will skip this patch entirely till you follow
the process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.



> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: "Theodore Ts'o" <tytso@mit.edu>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Eric Biggers <ebiggers@google.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Steven Filary <steven.a.filary@intel.com>
> Cc: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Amithash Prasad <amithash@fb.com>
> Cc: Patrick Williams <patrickw3@fb.com>
> Cc: Luke Chen <luke_chen@aspeedtech.com>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: Rgrs <rgrs@protonmail.com>
> ---
> v29->v30
> Comments pointed by Steven Filary <steven.a.filary@intel.com>
> - Add Suport for 26xx series
> 
> v28->v29
> Comments pointed by Ernesto Corona <ernesto.corona@intel.com>
> - Change documentation to the new dt-bindings yaml format.
> 
> v27->v28
> v26->v27
> v25->v26
> v24->v25
> v23->v24
> v22->v23
> v21->v22
> v20->v21
> v19->v20
> v18->v19
> 
> v17->v18
> v16->v17
> v15->v16
> Comments pointed by Joel Stanley <joel.stan@gmail.com>
> - change clocks = <&clk_apb> to proper clocks = <&syscon ASPEED_CLK_APB>
> - add reset descriptions in bindings file
> 
> v14->v15
> v13->v14
> v12->v13
> v11->v12
> v10->v11
> v9->v10
> v8->v9
> v7->v8
> Comments pointed by pointed by Joel Stanley <joel.stan@gmail.com>
> - Change compatible string to ast2400 and ast2000
> 
> V6->v7
> Comments pointed by Tobias Klauser <tklauser@distanz.ch>
>  - Fix spell "Doccumentation" -> "Documentation"
> 
> v5->v6
> Comments pointed by Tobias Klauser <tklauser@distanz.ch>
> - Small nit: s/documentation/Documentation/
> 
> v4->v5
> 
> V3->v4
> Comments pointed by Rob Herring <robh@kernel.org>
> - delete unnecessary "status" and "reg-shift" descriptions in
>   bindings file
> 
> v2->v3
> Comments pointed by Rob Herring <robh@kernel.org>
> - split Aspeed jtag driver and binding to separate patches
> - delete unnecessary "status" and "reg-shift" descriptions in
>   bindings file
> ---
>  .../devicetree/bindings/jtag/aspeed-jtag.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml
> 
> diff --git a/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml b/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml
> new file mode 100644
> index 000000000000..1a412e83b81b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml

Use filename matching compatibles, so aspeed,jtag.yaml

> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/jtag/aspeed-jtag.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed JTAG driver for ast2400, ast2500 and ast2600 SoC
> +
> +description:
> +  Driver adds support of Aspeed 24/25/2600 series SOC JTAG controller.
> +  Driver implements the following jtag ops
> +    freq_get
> +    freq_set
> +    status_get
> +    status_set
> +    xfer
> +    mode_set
> +    bitbang
> +    enable
> +    disable
> +
> +  It has been tested on Mellanox system with BMC equipped with
> +  Aspeed 2520 SoC for programming CPLD devices.
> +
> +  It has also been tested on Intel system using Aspeed 25xx SoC
> +  for JTAG communication.
> +
> +  Tested on Intel system using Aspeed 26xx SoC for JTAG communication.
> +
> +maintainers:
> +  - Oleksandr Shamray <oleksandrs@mellanox.com>
> +  - Jiri Pirko <jiri@nvidia.com>
> +  - Ernesto Corona<ernesto.corona@intel.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

Drop

> +      - items:

Drop

> +          - enum:
> +              - aspeed,ast2400-jtag
> +              - aspeed,ast2500-jtag
> +              - aspeed,ast2600-jtag
> +
> +

Just one blank line. Since this was not tested, I will skip review of
the rest.

Best regards,
Krzysztof

