Return-Path: <linux-aspeed+bounces-2735-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C9C2FCD4
	for <lists+linux-aspeed@lfdr.de>; Tue, 04 Nov 2025 09:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d11ZM6CtKz3bfV;
	Tue,  4 Nov 2025 19:19:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762244347;
	cv=none; b=J/aQkLQtS171BCaSJsD8lczhJJ1u49sZ9x3IQu/RqO7RxyK3lRTtiGRDxLtV77NHieaK7zmKf1JDrg+WC8yN99adPQ1KRGJ65KMemO6yK1IUTNAFfjgB1ZfgLrkm1381XncD29A6sERRlUO7W615HH8dsdnHy5Fzv0gm58xul83UL3X8zdT56m5HZb1j+uRVYxDzlm/id1lBmpxlrC6+UT5neLaoG2KVHgMhnnizTi3wA8y8WPTp4YiiEVPiNeBuU0niNKaxvQR5HUiJjHO8Y3v+KdSAGl8f3gkS1QsmHc180zhR96L+es+s9elMeToMxA2O1xYCONgAhbkrXfYx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762244347; c=relaxed/relaxed;
	bh=4hf3yfP5WjFx5kEgG4kNJ9Ust+IArWtery7ZC6AeF2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZnrQhlxilOD8w/YyS13XscHWUG4h6G0mIg1injlkVj5xWnDVTwI3kuOO77QHm8n5wETTp3rePNBpr7IonfrEY/uq7hPOtRc1aaiPqsLfMkt8jGXW8fJbtQAvDXOhWps1hH8YUua/j5yePItDTK9QdKySvXF/M4PQ+hsnq763or6NABKKMA+N5b0+MM/dfWdRxkYq29QZJqfM74xjTuEKa+YV9+dKnCKKCGDo2XHqT6AZwCwEaJTs5hXOctx6N+7DMvyoq4qrxp1F5ZoRBqsP3zlYZhP0sSaJrh60ULgUMR390LYgbvnbgejA2HmMfDVL65FixPc1hOrhk2HslBz/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EX3qRrcN; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EX3qRrcN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d11ZL4L5xz3bf8
	for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Nov 2025 19:19:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4740D43651;
	Tue,  4 Nov 2025 08:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927A6C4CEF7;
	Tue,  4 Nov 2025 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244344;
	bh=i4i2ZezZUkHgyxzI36i1jgZxCZSfy03Oaa0uCLjqanU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EX3qRrcNsxISHXHS3gzCD3Q+b90CC4lAcftjm0w3Ite6R4rXomGsnm4tqFBqYOBbO
	 NT29rRKutGn8d1BWvXZgSzWx3d0eHPCSjDk7iwpkP6I3hRZcYj1SSmMV1gcI4dPsMb
	 c6hu+ZgxWlSPmfFbBJa3+qMDKfRPtD/AlDjzqa+yHRsd8j1EmMaEk9urXUYFt975k+
	 vlSNOV9xLf5+DpkPy3nNQwce5lq7Kro2PnzI3gbusASkI3Z6aOfpw3ldRE+ittBwZQ
	 mQoC/OQxInggfVu74SM/X/Pxt3FfzYcBUYcqCX0EAud0fx+rVJIAnQV1ihGgW7oFi2
	 9oeKFf88+901w==
Date: Tue, 4 Nov 2025 09:19:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Message-ID: <20251104-victorious-crab-of-recreation-d10bf4@kuoka>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 03, 2025 at 03:39:16PM +0800, Jacky Chou wrote:
> Create the new compatibles to identify AST2600 MAC0/1 and MAC3/4.
> Add conditional schema constraints for Aspeed AST2600 MAC controllers:
> - For "aspeed,ast2600-mac01", require rx/tx-internal-delay-ps properties
>   with 45ps step.
> - For "aspeed,ast2600-mac23", require rx/tx-internal-delay-ps properties
>   with 250ps step.

That difference does not justify different compatibles. Basically you
said they have same programming model, just different hardware
characteristics, so same compatible.

Best regards,
Krzysztof


