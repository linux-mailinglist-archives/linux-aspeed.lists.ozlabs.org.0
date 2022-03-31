Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B94ED989
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 14:20:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTj7l1RvJz2yh9
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 23:20:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=p/8v7ChW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com;
 envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=p/8v7ChW; 
 dkim-atps=neutral
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTj7f3NBQz2yPF
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 23:20:44 +1100 (AEDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22VCK404046663;
 Thu, 31 Mar 2022 07:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648729204;
 bh=U/Bd5JEPMZiETyPMjxTZkK0xTLGPXruq7bxamvC/BPE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=p/8v7ChWKtnstAQkNaNKlPYO5HNv82HVDZDet7QGSG/V+7MQvfJ0L1rLZSrS3cYVQ
 L60fynQTGf9ZeFkH483HHSEwH8AuIsvGGAlRHDANvK833a3Z8cySbMJzx2T82HQjcI
 FeQy5iJdInmuqxeeAnxXgE+wrN+S9S16BOMbqRyk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22VCK4cX045704
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 31 Mar 2022 07:20:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 31
 Mar 2022 07:20:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 31 Mar 2022 07:20:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22VCK2XC083438;
 Thu, 31 Mar 2022 07:20:03 -0500
Date: Thu, 31 Mar 2022 17:50:02 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Message-ID: <20220331122002.55vwda6fnnenuqhf@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-3-clg@kaod.org>
 <20220330191908.nhg52a5ayzczpzai@ti.com>
 <2a411a3e-4b7f-c116-b595-f33bffccb4e7@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a411a3e-4b7f-c116-b595-f33bffccb4e7@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 31/03/22 09:36AM, Cédric Le Goater wrote:
> Hello Pratyush,
> 
> On 3/30/22 21:19, Pratyush Yadav wrote:
> > On 25/03/22 11:08AM, Cédric Le Goater wrote:
> > > The "interrupt" property is optional because it is only necessary for
> > > controllers supporting DMAs (Not implemented yet in the new driver).
> > > 
> > > Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > > Tested-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Tao Ren <rentao.bupt@gmail.com>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Cédric Le Goater <clg@kaod.org>
> > > ---
> > >   .../bindings/spi/aspeed,ast2600-fmc.yaml      | 87 +++++++++++++++++++
> > >   MAINTAINERS                                   |  9 ++
> > >   2 files changed, 96 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > > new file mode 100644
> > > index 000000000000..e16bbcd38560
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > > @@ -0,0 +1,87 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/spi/aspeed,ast2600-fmc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Aspeed SMC controllers bindings
> > > +
> > > +maintainers:
> > > +  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > > +  - Cédric Le Goater <clg@kaod.org>
> > > +
> > > +description: |
> > > +  This binding describes the Aspeed Static Memory Controllers (FMC and
> > > +  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> > > +
> > > +allOf:
> > > +  - $ref: "spi-controller.yaml#"
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - aspeed,ast2600-fmc
> > > +      - aspeed,ast2600-spi
> > > +      - aspeed,ast2500-fmc
> > > +      - aspeed,ast2500-spi
> > > +      - aspeed,ast2400-fmc
> > > +      - aspeed,ast2400-spi
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: registers
> > > +      - description: memory mapping
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +patternProperties:
> > > +  "@[0-9a-f]+":
> > > +    type: object
> > > +
> > > +    properties:
> > > +      spi-rx-bus-width:
> > > +        enum: [1, 2, 4]
> > 
> > No need for this. It should already be taken care of by
> > spi-peripheral-props.yaml
> 
> So we could drop the whole 'patternProperties' section ?

Yes.

[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
