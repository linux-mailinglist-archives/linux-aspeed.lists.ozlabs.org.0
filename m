Return-Path: <linux-aspeed+bounces-3532-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFLoEMGvm2mi4gMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3532-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Feb 2026 02:39:13 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02911171590
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Feb 2026 02:39:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fK3RZ6HFWz30hq;
	Mon, 23 Feb 2026 12:39:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771810746;
	cv=none; b=oON1H5y1ETCAeS48zkRk2JykBoRbpNwdwkXpRztxfXE6YS5is130VrMGT2Foe1i/pjJFt0juCHSSKso2YHGilh9KIUbvMYTiU5w0c00Vv5BbKDhwHsFuY7PlnXCUMMx9imNKxHKI/8k/NEy2jEQY8kBgG2dnx9aW9M3aM37+89aJMgF4fvhDk/BA56Ql5HN2YjxJZ9qcARW9sjA+wt7EG496TXkKX7Lz+y3H0bTFbA+DngR0JMqrpXc7X+m0GvtZVlgaa+95MxECQ60EHqLNWfyWIOQVjeyGOW63qVNL28lKFypHgdwV7u+PMvCf9j5goBRTk4IkhXMvK7z45qDayw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771810746; c=relaxed/relaxed;
	bh=MIR4lVMnkdb804M5R0VdfzVoSc5X3oa8pX/88m18+4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YVSUgGZ7hyCZtn8PesWJm33Wx2yjVkrhyTAmD2fcQWOxOx4EN7vp3BT2RYKTB9xEBhRRWXCwy42J7SOaUACqWFCFNVsaduGnFkPUgFsD1Dfq+/P17nSHElIL+TBPw2v4rn+9MjWrd8qUq87OtF0Q0RoFTVQAYEvxTtcP8rKGxdXoI3RwqGmRyCMb8NM0MGPaF684GOLrq+1ikWM+Gr7EFlMxF5E4psy1E+cDte+dXiPW3xQpjfgVZ8zTMi1l6wl95jL6IXjTjEItGR/JDQwSxRbLon8OYtHnELpUZ2BFNLxD9fds+UtDaLi7+s1FkxTWwQXfmMPnLSl9sd99xNnU1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y6EXrtL1; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Y6EXrtL1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fK3RY54m4z2xSG
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Feb 2026 12:39:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771810744;
	bh=MIR4lVMnkdb804M5R0VdfzVoSc5X3oa8pX/88m18+4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Y6EXrtL1+IpDBKjQ+CE4IfTVsQtB4H+67UIbgSuuUBAw/68tx9orgqZhqB0my/a2e
	 DcfYfLefmXr/bwwiAnrpkKeEjF8vwqRW8pjxh906dww/IGvC7hTxGaMyqfSYy6TqQH
	 +/gGcNSOJpZngELx/1DV3zHiXzV+ftpQFDjjzCWoQ5GyHO8oeP5U6/L3Xmgl+pBs1B
	 NvPSZDM683jbwEBUqsiJOWJBqaM2uo+UGA3UFXk1F2H3ktnHOtuRQ/1eA44KReyEo7
	 lsGV2et7gbICX0wqS0Jq5Fo1dNVK3LnfRb2Mi/HPdrojDzDPxaZQBEiTHpmCNafSqT
	 6tGr3RRVwS7Tw==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C9C45600E1;
	Mon, 23 Feb 2026 09:39:01 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Dirk Chen <dirkchen@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260219-b4-anacapa-dts-fix-v3-1-4f70fd2d1070@amd.com>
References: <20260219-b4-anacapa-dts-fix-v3-1-4f70fd2d1070@amd.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
Message-Id: <177181074172.1150784.15634520346683503197.b4-ty@codeconstruct.com.au>
Date: Mon, 23 Feb 2026 12:09:01 +1030
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3532-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:dirkchen@amd.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 02911171590
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 23:44:47 +0800, Dirk Chen wrote:
> The Anacapa board features Atmel 24C2048 EEPROMs on i2c0 and i2c1, which
> are used to store retimer configurations. Add the corresponding device
> tree nodes to support these components.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


