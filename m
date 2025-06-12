Return-Path: <linux-aspeed+bounces-1394-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE3AD6756
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Jun 2025 07:32:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHrkY174rz2xHT;
	Thu, 12 Jun 2025 15:32:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749706325;
	cv=none; b=W54BhrTVw+n4SBZ7bBVOTPpQPNnD/3RFC/9opiB2s5bCvkue7ndLjeXaUBbQqR/fbTcHSYJbDP0K/6w+xiHPT7GPP6xzzlu+esgjNLGKCpalzhfUUF72z2DplGll4Q2qSgCRwS5HkOD7wjCFsv5WuKIcfCSC5FDzFnn0ibdMdE4JY2LBwQxF1j92covOHIO+KyiXvCCXUhBrVNr2iUFeb8oj4LIQsfMqfZblhlyuwL6zyil9HwKfeE9l+jfld35NgoGv8JOOW+nvDWHVUchBNl97YpM3wUb5oV/ljbnalVImG2ruRAdvi0lTHou/PXCoUwKQK8Xh2dl545YsftPaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749706325; c=relaxed/relaxed;
	bh=Hua5sQUgLCroJtEA/gusAW9GCKDx3U8bgUR5LPfnzhw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jKsSaZGbfXbcdaq2yeS+M7Tpw2CPmIGiF/1q6gq0UbBsDj2ZX7Q6/77CM0TqCs28NtA/V1WTzZ1EHIPUN0sAxndGXbGGwmuAgsNflf+ZWzpxctsIVaaO/J+0md3lsZ/HzeWSNgd37sHKdhyEr6RoN2+zwWjaGlQMa2VJSidc+XWXbHFu92y+3U9TDxqnnMTCK8iJZewPOrulpqIAPcvKJ6eUWFSGo84KzcrIhOpC1ispxl7jA0Yc1Qvfd5Ik2qm4JODFK1DWCtFpK58Kn1JDFfAOJ/si1T74fMNeQ/fJV71pLFYke1C9gM+VzzZOgf/5HzjCe4dQwo85QTeuLWP2Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZyN1xgxD; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZyN1xgxD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHrkX24t5z2xGw
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Jun 2025 15:32:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749706321;
	bh=Hua5sQUgLCroJtEA/gusAW9GCKDx3U8bgUR5LPfnzhw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZyN1xgxDp+vYZ2LEUoYVDDFhTjjdGrDq9YygHqnUAVRi+XIpSNL9SQn/omT/w8rVq
	 9SF5ioVDuo+WOuleqE1fkuf2aUlIYRtvj1mnRAWAlkbdj3OIQeR7phkrJEiQ1FXfE0
	 TXOce0dQb3o1mqIDGojdJrVus6GX+6j6Xaed87t75IvC4dXgcseLPyTBRQYwPzy+W+
	 VdqofRLHjm+YdIRmTxzzGhLE7gLhhYuqnMpc+OYZ/Snw90F9KuW5dtS70IFtd2hW6L
	 swnXC3U+xeUnKlF/sV47LLqbIeLI1oGXgKvuSq9TUQe3hTlhPGcvUGJgyBVtHFWHS+
	 cAsM/qFdkoGdA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BAAF6699C;
	Thu, 12 Jun 2025 13:31:59 +0800 (AWST)
Message-ID: <3fe9885cc54a328932915a63816ac1b7952689a2.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ankit Chauhan <ankitchauhan2065@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Jun 2025 15:01:58 +0930
In-Reply-To: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
References: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ankit, thanks for the fix.

Regarding the subject, can you please use the prefix 'ARM: dts:
aspeed:'? From there, I'd prefer something like:

   ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED nodes

On Thu, 2025-05-29 at 17:09 +0530, Ankit Chauhan wrote:
> Fix an obvious spelling error in the dts file for Lanyang BMC.
> This was reported by bugzilla a few years ago but never got fixed.
>=20
> Reported by: Jens Schleusener <Jens.Schleusener@fossies.org>

Please make sure these tags reflect convention:

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-t=
ested-by-reviewed-by-suggested-by-and-fixes

Rather than spaces, they use `-` to separate words, so:

Reported-by: ...

> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D205891
>=20
> Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>

Finally, all the tags should go together in the 'trailer' (final
paragraph). There should not be an empty line between the `Closes:` tag
and your `Signed-off-by:` tag above.

Cheers,

Andrew

