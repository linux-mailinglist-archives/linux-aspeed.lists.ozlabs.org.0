Return-Path: <linux-aspeed+bounces-490-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4513A125F8
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jan 2025 15:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY7Yq0RF9z2ysB;
	Thu, 16 Jan 2025 01:25:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736951102;
	cv=none; b=dyELhbxa0EQtljP0zl+2DmfrsjeK034hO2i6E/S3qU0hMB0+FTtoQChtzNbWkBikRT3cxUOhfZh3AJupOk87w2EfAh3IMRJARlZFVmWLZPJSOxWo/CzGzHaONPqEPSxRBLysz4w7WbQHpTNtUKcvcJHED8ct4X/gJRJOmE1pnUXwAShnKuwHqVTvW5tPjbLAVwc/QDuYGijZswYeatO3d74fiySUGok2dB9AqrHt2GpoYoo6ewAyyo0FWhWWXflvSgUT8qR5aRUDdamtDD+liFFXRTRm+Tij8DWmQF/jFjZRYAEDaoUqkzN8j/SJ+IG7wGEpNLz+HNmRtVAU8mtFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736951102; c=relaxed/relaxed;
	bh=xaOcGj9j9Cemvm+vFePyCuGaT0+qHLpoq0/snIH1qN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEGKq15gSrhCCKvjHRA2j1pWfbvZoOND/xyniNBUtgE+7dhnxIfGHsmfvRPErgTGixhHian7K4CLYnewG7OLo/qxu87gP9kA8FGcenb4TA3ZDX3D1JcI1PFRIhKgZY4c/1Cl+X0JbTYDBS2KyXcPAWzU88wYt3Vdfo02kjjibMNhHFpNU1Jpce64NRUEkbgSfgv/LnwWuPTB4KhgYuzl+fs6dIiWay4u8x59K1gKopF475MB4xHhmrPrA64f+YiAkHXAnhcfnyuglIK4/uiLGEhuTvj2MPZOwOsE/kM+A5irwbVfUKkQxl+4fSQY0GKDKmobsZ1AJmOt0CUcJhsx0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=upw8EeuX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=upw8EeuX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY7Yp2Yt5z2yZ6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jan 2025 01:25:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6325A4056A;
	Wed, 15 Jan 2025 14:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1BAC4CED1;
	Wed, 15 Jan 2025 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736951098;
	bh=WMcIZXIWDa7GXnAeCZ5NxIJiTsw13XWfpqK4pCdgiWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upw8EeuXYaML9/AhOywPJDa8xi5WeR9m2yIsNolj7dP6UH8uX/xTo9rVWXny5BMTZ
	 5kTFQyivcoBL+oastN9JqrQe83FruI51a77YqLwe3+7tX9GRcy/piFAAR5Hi/iZ3Ob
	 D0a7xaDbn513HeQ/MUnlsaiuvxDctoKXJhl3txNtdwiRqfYrJEhk4eeo5P1X0Z6oFJ
	 jP89kAQhk5CKJsTMXGDDzO5WYoXqqIhFWMm/6UbCeTkVhvs6DUJMf816Z5iEyHUkO+
	 bake0gHU9EG6GTTYaKYBI4BEEZ1A+HJzsGVWCiqY4AVHvCQ8HDDmEv0nHySoX000YD
	 k1PSgi2nMvPiA==
Date: Wed, 15 Jan 2025 08:24:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, openipmi-developer@lists.sourceforge.net,
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
Message-ID: <20250115142457.GA3859772-robh@kernel.org>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
 <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 15, 2025 at 09:45:50AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 14, 2025 at 04:01:37PM -0600, Ninad Palsule wrote:
> > Allow parsing GPIO controller children nodes with GPIO hogs.
> > 
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > ---
> >  .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> > index b9afd07a9d24..b9bc4fe4d5a6 100644
> > --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> > @@ -46,6 +46,12 @@ properties:
> >      minimum: 12
> >      maximum: 232
> >  
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> 
> Choose one - suffix or prefix. More popular is suffix.

I was about to say that, but this matches what gpio-hog.yaml defines. 
Why we did both, I don't remember. We could probably eliminate 
'hog-[0-9]+' as that doesn't appear to be used much.

Long term, I want to make all gpio controllers reference a gpio 
controller schema and put the hog stuff there. Then we have the node 
names defined in 1 place.

Rob

