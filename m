Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A7778243
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 22:40:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ihaai8JM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMJjL4qtMz2yZV
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Aug 2023 06:40:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ihaai8JM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=zxi7=d3=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMJjB3P2zz2xTR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Aug 2023 06:40:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0536653AA;
	Thu, 10 Aug 2023 20:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71169C433C7;
	Thu, 10 Aug 2023 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691700043;
	bh=rSop7mtUo0fVzOHPGZwCTWk0QCEHsqpxokmcv5oQRik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ihaai8JMGBeEaVhKzZgO1THthNuHwjwNz5ayoQWfDv9qBcUAs4+jYjHimYtPrdp/V
	 jNkYz8WWtJau6tL0NXJf2xDX6Ohvj51I7lJX9QFsRf+porZP876As9/YDvyTOKC3xi
	 HhgM8dUEQSh3AZGAqnHRwq+Jd0Ie8t8eDK+qGfhYcOw7ATCzm9DEJjmQdF3isaOICM
	 6Q/7g2PuydUAtoRDpp4rOe3bkFbARIZGWSlbhbIERPC0HFhvfrFBwSeDfA3bmz2tMt
	 hV74dAdmBX8IgKyg3/Zv9OPUx577a2YSX8djziRBjSCAyvmF8xqVqgMfXjVHdg7pZA
	 Sc9g8NNdoyZLw==
Received: (nullmailer pid 1136259 invoked by uid 1000);
	Thu, 10 Aug 2023 20:40:41 -0000
Date: Thu, 10 Aug 2023 14:40:41 -0600
From: Rob Herring <robh@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite 4
 board
Message-ID: <20230810204041.GA1135827-robh@kernel.org>
References: <20230810070032.335161-1-Delphine_CC_Chiu@wiwynn.com>
 <20230810070032.335161-2-Delphine_CC_Chiu@wiwynn.com>
 <169165202180.3911788.1110313008758620193.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169165202180.3911788.1110313008758620193.robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 10, 2023 at 01:20:21AM -0600, Rob Herring wrote:
> 
> On Thu, 10 Aug 2023 15:00:29 +0800, Delphine CC Chiu wrote:
> > Document the new compatibles used on Facebook Yosemite 4.
> > 
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changelog:
> > v7 - Revise changelog format
> > v6 - Change project name from yosemitev4 to yosemite4
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810070032.335161-2-Delphine_CC_Chiu@wiwynn.com

The bot was having an issue. This can be ignored.

Rob
