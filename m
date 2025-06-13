Return-Path: <linux-aspeed+bounces-1438-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63813AD832F
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Jun 2025 08:22:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJTpY1Hp8z2yfx;
	Fri, 13 Jun 2025 16:22:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749795765;
	cv=none; b=JDBBrx1nr9daF7PS50YdqBQ5RkR4abRPZojnyUFwI7MkbK+TbauXP3qnI3WHxXkRMMisEFwKyIww2uZo2CRTOSCG0dl8KA/cA5ikED01iwnVQxw07UVoEJMakSdiFYQfa7VWVbEP4Wj05tZrnK8Qe723qXIogyYGTttaEIM68qRm3LKPFhR6zTXeK1DUZQQ4qkCuKeJcQs5iXdYC5PGw9ASHe1Qdk+ha3AYpn7AjFOTeBMLAfM+8zeTirf91NjnAfSpmvYIBwE9PqPBP3cHVJB/UoKFS2PvIjzFyCNqmFr4MtQOlh4cywx1MDnxfn7BhCMGGhMj82xtpUJJlIFZEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749795765; c=relaxed/relaxed;
	bh=uN1gPb2PJM1vKZa2B8fQ33X5LS8Zuqa+quq/5JZM2BA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NLmMuPFivXUcRPGWhe+pybLN5ajG5sn9UHZwb4JUzW1J+zIVtL+0T/krjp/2XVoOiYKtwUFJG43uRIFw/yordKCg5JOihm/hhUGIqh6lCoNX9MEiEAskn3EMJMMU7N89667jvBGGfwLE1jrra1aEiYbj0aGszDum2eFzHZViD4j/7jtfdwb63LJz+JAxIRuTGKS7PBhMYqBIVD8QDAY3E1f2gOJgM1ZXAwFy9ZU7A58zdiWtvRuTnI1m4JGnFpn4xrpmfrDgFlO8EkkCLRUVsfsqzJRk+cY2HKep2NA443H/ozdXzJ87DWRY/CXaczGU0tqUkOEGsxETzg5Bxd/LhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B40P4cfS; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B40P4cfS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJTpX3pbRz2xKN
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Jun 2025 16:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749795761;
	bh=uN1gPb2PJM1vKZa2B8fQ33X5LS8Zuqa+quq/5JZM2BA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B40P4cfSWEj4Q/LwKoGxYvT4RLjXhogL2r3AVuZNFrSQ292nwIkZyyIfsr6TMQwAS
	 CGgpA0sNwE0nIfTa2ujfVAzpvNpLtYq/idY1aK5rrPMFwgOUD8PC1SkqvA3YR65cKr
	 yloqW9w8OQ1lIixBEdWjeJiImDFbd5arK9CATd1Ev3FbqZJcf2SvDFLX3Vf6fNxxlV
	 Sms1eChY2DZW5N395hSbJbPe4nLNGEleb1u1LuAtJUWCLuGIoQ/LC/M5xeLLFwd1Ea
	 h43xtY7ffyR6GKo4TQK95/ceTkELC9GH5HKYOaKbO/roMChk2eF9TqZDGj7oX+iiM6
	 gZYh+bW+Xguzw==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 616D5680F3;
	Fri, 13 Jun 2025 14:22:40 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Ankit Chauhan <ankitchauhan2065@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
References: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED
 nodes
Message-Id: <174979576026.385457.16320702443597106607.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 15:52:40 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 12 Jun 2025 13:20:57 +0530, Ankit Chauhan wrote:
> Fix an obvious spelling error in the DTS file for the Lanyang BMC
> ("lable" → "label"). This was reported by bugzilla a few years ago
> but never got fixed.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


