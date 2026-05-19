Return-Path: <linux-aspeed+bounces-4098-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIJoG5PHDGp2lwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4098-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:26:59 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F81584A9A
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:26:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmRh0R1gz2xwH;
	Wed, 20 May 2026 06:26:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779178799;
	cv=none; b=Wbsjsi+Riyp/W26Ss133Bys1r5OOH0tvm58QDchGWUlXyTlNMYA2ZY4DB8nvIUo2dICgCMAOGWR9TYK+Ml2N6vRRej52ES6s17zu9ltGrqZQ/fo5WIf94NI6lkva2k6GHbHBHJIDTIBCjtYPiESjkjcSluwJqMSLfHFJEy6xwGBuF8JbWOZ7jcpo5gfN3rViXkXlyIaaAvdUbMzo9IGv2FMzIt6rhf3B9cD5u7IG7W43rz+X0HFD7+w2BXzrg3WU7tWUWXtVTqWrMwMg/MRwtCc7aq/x+J1tRlIXvuPKYUOMaOUVXcNs2pV6bQftBv1VPGixPw5dkW1D6xsw0CMcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779178799; c=relaxed/relaxed;
	bh=zeEyivkOKMiA9Q1LCcEUSrlkL6r0K7vpJgifgOOUXs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQCvJqVgn291JdF2ivBjiddef1eZpYiSseZ3ZpH8oWUa+jawy2KcVWgwZEkahSKFs+GWek8qwJo6vrj7I/ltlk9FoGoSbAq+KsAyZQdWVsP56PniDwbm+wECmmgOMeCfrWpprQ7ownFXRPqzVlpk+i9w+A9Q1fBch8+zWGOBOwXyG318ZvgFA4HyDsNCGTsjKIfXH6FFnVkwEK7CYy/i18ll/9z3x3tAvfM6cDjtjia5Dqo4rFowvCuTwTdd7hiQ9aJnNf+qakjYxl8599gsO39aiUlB5UblB2joDoki7QSksSpGS9uZEZFpL8XWTtTuMvxa9DUB1C9Edz30ZVhdnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i0cj+/fw; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i0cj+/fw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKSJr5TFYz2xSG
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 May 2026 18:19:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779178797; x=1810714797;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JfhAILNls4w2wXgWnGBbGRweRyrl7ebw7UAo4Oa5uio=;
  b=i0cj+/fwkDFZCZAGVXSFrSCFgfE6vHLhVyKztzdZYGIUbD6H3r1r5l4T
   4tz+F1Gw4efHnz3St1wdU+uJkCUxX/JuOxmsgm41/UHiucZqYg4E+YGj7
   DTnl6M785dxVTyX8wbLYw6vFibwoDiZiFCOvWsUY45zZFFOxd1T+M0qRa
   X1u3k9WiYhQa0WOvn+Pruv3DJ5iaIE00TD4sKWIqf+wMIMgKSvwMkHXWf
   VHWs8RcUg8VkAVNkUuBtx4hV2fZ8do0ZRxlipMuNTLV19wUHYhDLoR26K
   +X8/hFWUp90ePsBHi/9j9CJCOfWgTfvp0FAU4yQf7JxRoHdSK+A5tcCzB
   A==;
X-CSE-ConnectionGUID: Lf8U76M1QXe8FBDoR0GViw==
X-CSE-MsgGUID: B2oDeKA1R06A+FZ08M5p3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79193767"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79193767"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:19:51 -0700
X-CSE-ConnectionGUID: dszkr6AhSwGwtndes+ihNQ==
X-CSE-MsgGUID: FMbhInoVSOSua/h+sMvgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238873185"
Received: from unknown (HELO [10.102.88.45]) ([10.102.88.45])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:19:48 -0700
Message-ID: <62d6af80-62f1-4b74-b4e7-3311d319f56b@linux.intel.com>
Date: Tue, 19 May 2026 10:19:45 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
 <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
 <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4098-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:linux-aspeed@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:maciej.lawniczak@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dawid.glazik@linux.intel.com,linux-aspeed@lists.ozlabs.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawid.glazik@linux.intel.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 70F81584A9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/2026 7:02 AM, Andrew Jeffery wrote:
> 
> Sorry for the delay.
> 
> Given Krzysztof's R-b tag for patch 2 I've applied 3 (along with 1) to
> the BMC tree. Patch 2 should be picked up by Lee through the MFD tree.
> 
> Cheers,
> 
> Andrew

Hi Andrew,

Great news! Thank you.

Dawid

