Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43E897D81
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 03:50:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=btSvpyF/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V94MN1WFwz3dXW
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 12:50:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=btSvpyF/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V94MH41cNz3byl
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Apr 2024 12:50:35 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D9EC420172;
	Thu,  4 Apr 2024 09:50:32 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712195434;
	bh=sMJgocwG0ejwyAHece1APU7sO/OMGd+TkWb7n4BBNGU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=btSvpyF/upHJlsVY8A2BssX/zqlj3zpfHSY1CIG5LVwOc0UpxoxWMkucfh2t3i+p8
	 E7CJivKe9hMaSPzA9E4bjWTAWDOYq+OGPU8LyUoHijDpFzfxA8P7Y7+CMRpMjF/GSx
	 N0LkeNhlDrCSC5QDz6xApCRiFWIxK7PVzLjGfqIASC56VWuxOc38lRvUfGe9wfqEeu
	 DSgVlNui06ZG43jhwOqBk39HlSEgT1rP77E6NCxV3EXvmFqgQgr3y2+oigk4Iph8vW
	 LDRZnm5zCU1GRNDVRL5hxFO9fQb1E34YVPVIHg2dhtCfhrJv0fO3dSVH2CJwlSjDoz
	 Ddefked6QnxEA==
Message-ID: <496c6b2bf10bd8a1313740cd4047a2a153c13da8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: PeterYin <peteryin.openbmc@gmail.com>, Rob Herring <robh@kernel.org>
Date: Thu, 04 Apr 2024 12:20:32 +1030
In-Reply-To: <79b7e2ef-6f53-4642-ad3f-99b8ce780a7f@gmail.com>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
	 <20240328022231.3649741-4-peteryin.openbmc@gmail.com>
	 <20240401135637.GA342928-robh@kernel.org>
	 <ab76b0549172cf3e33d6242fa9ea3e6a87b4a58e.camel@codeconstruct.com.au>
	 <79b7e2ef-6f53-4642-ad3f-99b8ce780a7f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-04-03 at 17:18 +0800, PeterYin wrote:
> Thanks, I can wait you update it and send a new version for wdt driver.

I've sent v2:


https://lore.kernel.org/linux-watchdog/20240403020439.418788-1-andrew@codec=
onstruct.com.au/

Rob's okay with it:

https://lore.kernel.org/linux-watchdog/20240403171321.GA3996007-robh@kernel=
.org/

Feel free to address his comment there if you integrate it into your
series, though make sure to add his tag, keep my authorship, and append
your own S-o-b if you do.

Andrew

