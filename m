Return-Path: <linux-aspeed+bounces-3917-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBRfKQAn4GkIdAAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3917-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2026 02:02:08 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE69409228
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2026 02:02:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwyqD3Ms9z3069;
	Thu, 16 Apr 2026 10:01:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776088685;
	cv=none; b=mI+ZEgzjfORzG/f0jWcGONwCewx/5gBgj5DCm0K56dTze7D6MBih8ymO4R2JU+lThKT1p2rs15/v4bnwWKA0dROJ+9Za7RmCDTYuNmV9cyHMaXc1pc8Igkwh/eFHOs7sBSExnpFyKyMbkydjCSMzbe6iPW28ZSo8yoW2HKi5zYyaiLgRRd6wBDqyKOeF604E/zRuHcr78+mTEsFxzbkdPt6a82UUN3V+kFx7ar1voHdJyojuKZ96cPitAelDVR1YIxolbhpPmDS1u/VkwrcX69rR9OEG536L4wmsDKh3B8k2S3XcT29rE8+fLlib3JXNt7s6dCZnaUyGM8G086AOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776088685; c=relaxed/relaxed;
	bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FUUw7e2Um5fKPRtptKs/qKr433161aCLOuqrG/6iB9bpliYDJbJv7NIDsfMMWaZ9uUWVXMUn7qMjdpHw3WNRpinJlDFsTXud+fQ0EXyYL/MF82qig1c56KcdOWcGp+VPG1H8goF8LLi4iwMNydryShKX6DUCyVH1PxehE6sTy0EHqXCp0QJxV9x72oGTQp6K4L1W0absdCr+/UZXqG2AKnvCQnNUNFz4wnhU325mFsU2/loPsFRABxQBRv+bDlF/XVTnKBCS0nbB1NTPNW2TR7+ljrP8kqZmb5L8Cs3u1uhG0rBK5zrH3RGf6tunNt6FVxCCLZ4AgWpSJ5GpH7VfhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f0y7QCAc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=eleanor15x@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f0y7QCAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=eleanor15x@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fvTWc1HTWz2yS9
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Apr 2026 23:58:03 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b299b3c739so18732245ad.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Apr 2026 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776088682; x=1776693482; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=;
        b=f0y7QCAcuogF7XEGGowMkDLQFwlTxrsMov163niREpnWN6N/UVUgkniyqIob0TJuv/
         BEukSLQ3KHZZ1WTAmRl3kX1RvG1c8AHZApb/xNNwv7d2JDm2JHQGHTLvT9LQ9U1ClGaW
         c89lUi44XDdtmRl6zksZREl7Nm4XaR1nL/+iKSJPoVtsEhYo8XyPqKB6PPQcSfgo/rfY
         cG+quaZyJOHfxHzrxWFozQDcYikOs2JTufpPWIhAJEEJ6lYaDCPWDD/nUyTx4PJUEGqg
         Q7WfcVGki8rbeon4MEgNHb0CPkoBX2YQZh6WmcNoSHTGa8WGhOB3IAMaY3kH0j9CYRWS
         0OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776088682; x=1776693482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=;
        b=Ybnbcz0j9Lof16QVgonXRa1CumnlAowgSGBDN2GInQRKdLUewzxEU68TFxRZeuxJAM
         msflFZfjkpKF7D6ZEuWbKV/nt5AmWfC02U4E+RSJP073Dx78IeiyxGYQlzVt9FpqpEjS
         PLEHqTCAcKV8f6j/A11IswIUoKFApwdSPQ5pVaCGXdZQWpXuaJyvXhr2Xu/PDylSE8pT
         J6tsqC2ojSjeA+fYjDrExs2d58fpXJPMrlhW8Wmd77rxwKvulyAMXTjqq2s/a3kQ1gb/
         h5/bdpvMxUO7sRoeRHXzfVFlooGlL4aY3pETg6hykT7uzCdOM/fwsvyyTLYmdM5ude6H
         7g7A==
X-Forwarded-Encrypted: i=1; AFNElJ9Prss/IyCDGYpC4gCGiDJfo311nLS2VlPE2F5Zixd/edVDZ2krMeqbYv/2SKO5Hk9pegmtIKNeZLBdvR0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5+IGgATJu58tSeVYrsXEwZ9BYqLzi2d/nsz6Rz5Y7g3crxT97
	GSE+xdbz4Qz3RiWPBfWQrcp3GjWvwCe6UGT15Muol9waCrGQFmdnJYe9dZlJzQ==
X-Gm-Gg: AeBDiesZ44s8Ox9/jdK9F3+n/8fOA3HG/Zz8wmk4tUz9F2i/NenVFedlmPmtWNau0t6
	v3m56H7B8NdmDWCHCbldt5cklvoDhSBoNX3dOZWtInvwdCm/6b4RxS5a5JCYCtvj6gYcdo8ZL55
	9gkzvrcu/gun7ngY52UvYksRUQUmeBbbjXqDZ90H/Fe22g3nN4shVjSza0KVri40ZPdySgA7+0T
	9NIV9GuTCYjVX7KQRSeMD9aTMlN9qb4TGMhYdH1j9WQpMdWW2JvIXwhZLuL42Pnp4OJjUkKtNvh
	Tcm8aIS3sy2IRi/qfaMksC1L8NnqK5hWEag3K4YN2DJYVGGgYfjrZnbDuh9Et1GddTjWK+XRSCA
	NUtn8YdIkwRo6l/DRCdzW4Y7HHhdcvIhbEfYL1W1lmTBgkh1sQphdRIdtzbiFg5UxXm5lYpLALt
	gzUHmU92nU6l/Ztsr6CRnBu6MMhYuv7LnQl2csh2d4Jss+nrEtftWxMTj2Zq4cp4OU0CW+a9nU3
	IMrzwYd74DZnA==
X-Received: by 2002:a17:903:284:b0:2b2:5822:7a70 with SMTP id d9443c01a7336-2b2d5a63d4dmr133027285ad.38.1776088681795;
        Mon, 13 Apr 2026 06:58:01 -0700 (PDT)
Received: from localhost.localdomain (61-230-3-9.dynamic-ip.hinet.net. [61.230.3.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f36351sm113068545ad.69.2026.04.13.06.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:58:01 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: afaerber@suse.de,
	andrew@codeconstruct.com.au,
	eleanor.lin@realtek.com,
	james.tai@realtek.com,
	joel@jms.id.au,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller drivers
Date: Mon, 13 Apr 2026 21:57:56 +0800
Message-Id: <20260413135756.8796-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
References: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[58];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3917-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:afaerber@suse.de,m:andrew@codeconstruct.com.au,m:eleanor.lin@realtek.com,m:james.tai@realtek.com,m:joel@jms.id.au,m:linusw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-realtek-soc@lists.infradead.org,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[eleanor15x@gmail.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor15x@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,glider.be:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,realtek.com:email]
X-Rspamd-Queue-Id: EDE69409228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On 13/04/2026 11:23, Yu-Chun Lin [林祐君] wrote:
>>> No dedicated maintainers are shown for Realtek SoC pin controllers, except
>>> pinctrl subsystem maintainer, which means reduced review and impression of
>>> abandoned drivers.  Pin controller drivers are essential part of an SoC, so in
>>> case of lack of dedicated entry at least cover it by the SoC platform
>>> maintainers.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>>
>>> This patch should go via Realtek SoC maintainers, not pinctrl.
>>> ---
>>>  MAINTAINERS | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 10d12b51b1f6..374ce55e4fb6 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3373,6 +3373,7 @@ F:
>>> Documentation/devicetree/bindings/arm/realtek.yaml
>>>  F:     arch/arm/boot/dts/realtek/
>>>  F:     arch/arm/mach-realtek/
>>>  F:     arch/arm64/boot/dts/realtek/
>>> +F:     drivers/pinctrl/realtek/
>>>
>>>  ARM/RISC-V/RENESAS ARCHITECTURE
>>>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> --
>>> 2.51.0
>> 
>> Acked-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>
> So James will pick it up?
>
> Best regards,
> Krzysztof

Sorry for the confusion. I'll pick up this patch and include it in a series
along with the maintainer updates and other DTS changes. I plan to submit
the series to soc@ during the v7.1-rc1 to v7.1-rc5 window.

Best regards,
Yu-Chun


