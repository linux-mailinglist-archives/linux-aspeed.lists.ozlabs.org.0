Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42998B3F87
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 20:43:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pEpZMXqu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VR1p075htz3cZn
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Apr 2024 04:43:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pEpZMXqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR1nq455Mz3cY6;
	Sat, 27 Apr 2024 04:43:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89D2862101;
	Fri, 26 Apr 2024 18:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04B0C113CD;
	Fri, 26 Apr 2024 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157002;
	bh=//roZ7d56KeyEoiiQbKnxou+fpOtupIebykulRJaAnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEpZMXquU9zZvYVZjS04pb+WnKxoGkbsYMhf9/TGM5BvUTar3e6Lvy52Q748UiPXi
	 +YMQeYBpomVn/1IK01fDbkBHSwj9PEbMomSkc1J0HisKywT/2EHN6jEPmlQCM0DD5U
	 y48DtWApNH3E3nHltE3hWBZErpw92MHtOvP/TVTYrxQcbufqXZEdzZcqbQqdG8JniR
	 vlQQoapcuHOqFyaged4CjkUOwro5cofI1yDjSbICZ7+2TysZw1F6CJp7d/38MsFFAX
	 rG7xFLtvuKBUcY8ZBh2yWPjubCehAQlfrJOGRB0Vet5TkWuFDEKiP14HcEY96EqFAY
	 ydH4x1g3aF2Dw==
Date: Fri, 26 Apr 2024 13:43:19 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 08/14] dt-bindings: fsi: ast2600-fsi-master: Switch to
 yaml format
Message-ID: <20240426184319.GA2558853-robh@kernel.org>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-9-eajames@linux.ibm.com>
 <5822e000-01d3-442c-bb52-04fab87cb3da@kernel.org>
 <24e7644e-f9ff-4a4b-8883-33b2f69b36cf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e7644e-f9ff-4a4b-8883-33b2f69b36cf@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2024 at 10:13:52AM -0500, Eddie James wrote:
> 
> On 4/26/24 01:25, Krzysztof Kozlowski wrote:
> > On 25/04/2024 23:36, Eddie James wrote:
> > > Switch to yaml for the AST2600 FSI master documentation.
> > > 
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > ---
> > >   .../fsi/aspeed,ast2600-fsi-master.yaml        | 72 +++++++++++++++++++
> > >   .../bindings/fsi/fsi-master-aspeed.txt        | 36 ----------
> > >   2 files changed, 72 insertions(+), 36 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
> > >   delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
> > > new file mode 100644
> > > index 000000000000..f053e3e1d259
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
> > > @@ -0,0 +1,72 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Aspeed FSI master
> > > +
> > > +maintainers:
> > > +  - Eddie James <eajames@linux.ibm.com>
> > > +
> > > +description:
> > > +  The AST2600 and later contain two identical FSI masters. They share a
> > > +  clock and have a separate interrupt line and output pins.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - "aspeed,ast2600-fsi-master"
> > > +      - "aspeed,ast2700-fsi-master"
> > This wasn't tested. No quotes. Do you see any other example like this?
> 
> 
> Strangely this passes make dt_binding_check for me... And Rob's bot didn't
> seem to catch it either. Just an oversight, I'll fix it.

Disabled due to yamllint bug. The fix is now released, so that reminds 
me to go enable it.

Rob
